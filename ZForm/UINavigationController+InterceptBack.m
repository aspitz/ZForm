//
//  UINavigationController+InterceptBack.m
//  ZForm
//
//  Created by Ayal Spitz on 7/22/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "UINavigationController+InterceptBack.h"
#import "UIView+ViewSearch.h"
#import <objc/runtime.h>

@implementation UINavigationController (InterceptBack)

+ (void)load
{
    Method realShouldPopMethod = class_getInstanceMethod([UINavigationController class], @selector(navigationBar:shouldPopItem:));
    Method fakeShouldPopMethod = class_getInstanceMethod([UINavigationController class], @selector(_navigationBar:shouldPopItem:));
    
    if (realShouldPopMethod != nil) {
        method_exchangeImplementations(realShouldPopMethod, fakeShouldPopMethod);
    }
}

- (BOOL)_navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
    UIViewController *targetViewController = nil;
    for (UIViewController *viewController in [[self viewControllers] reverseObjectEnumerator]) {
        if ([viewController.navigationItem isEqual:item]) {
            targetViewController = viewController;
            break;
        }
    }
    
    BOOL pop = YES;
    
    if ([targetViewController respondsToSelector:@selector(shouldPop)]) {
        pop = [(id<UIViewControllerNavigationExtension>)targetViewController shouldPop];
    }
    if (pop) {
        // This will actually invoke the real method, since the implementations are swapped
        pop = [self _navigationBar:navigationBar shouldPopItem:item];
    }
    
    return pop;
}

- (UIView *)backBarButtonItem
{
    NSArray *items = [self.navigationBar subviewsOfKind:NSClassFromString(@"UINavigationItemButtonView")];
    if ([items count] > 1) {
        items = [items sortedArrayUsingComparator:^NSComparisonResult(UIView *view1, UIView *view2) {
            if (view1.frame.origin.x < view2.frame.origin.x) {
                return NSOrderedAscending;
            }
            else if (view1.frame.origin.x > view2.frame.origin.x) {
                return NSOrderedDescending;
            }
            else {
                return NSOrderedSame;
            }
        }];
    }
    
    return [items count] > 0 ? items[0] : nil;
}

@end
