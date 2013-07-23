//
//  UINavigationController+InterceptBack.h
//  ZForm
//
//  Created by Ayal Spitz on 7/22/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (PKAdditions)

- (UIView *)backBarButtonItem;

@end


@protocol UIViewControllerNavigationExtension <NSObject>

- (BOOL)shouldPop;

@end
