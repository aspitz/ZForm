//
//  UINavigationController+Animation.m
//  RegisterView
//
//  Created by Ayal Spitz on 8/17/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "UINavigationController+Animation.h"

@implementation UINavigationController (Animation)

- (void)pushViewController:(UIViewController*) controller withTransition:(UIViewAnimationTransition) transition{
    controller.view.frame = CGRectMake( -320.0 , self.view.frame.origin.y, 320, self.view.frame.size.height);

    [UIView beginAnimations:nil context:NULL];
    [self pushViewController:controller animated:NO];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
//    self.visibleViewController.view.frame = CGRectMake( 320.0 , self.view.frame.origin.y, 320, self.view.frame.size.height);
    controller.view.frame = CGRectMake( 0.0 , self.view.frame.origin.y, 320.0, self.view.frame.size.height);
    [UIView commitAnimations];
}

- (void)popViewControllerWithTransition:(UIViewAnimationTransition) transition{
    [UIView beginAnimations:nil context:NULL];
    [self popViewControllerAnimated:NO];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
}

@end
