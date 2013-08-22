//
//  UINavigationController+Animation.h
//  RegisterView
//
//  Created by Ayal Spitz on 8/17/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Animation)

- (void)pushViewController:(UIViewController*) controller withTransition:(UIViewAnimationTransition) transition;
- (void)popViewControllerWithTransition:(UIViewAnimationTransition) transition;

@end
