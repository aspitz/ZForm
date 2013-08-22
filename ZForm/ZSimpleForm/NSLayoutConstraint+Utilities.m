//
//  NSLayoutConstraint+Utilities.m
//  RegisterView
//
//  Created by Ayal Spitz on 8/7/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "NSLayoutConstraint+Utilities.h"

@implementation NSLayoutConstraint (Utilities)

+ (id)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attribute equalToItem:(id)view2{
    return [NSLayoutConstraint constraintWithItem:view1
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:view2
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}

+ (NSArray *)constraintsWithItem:(id)view1 equalToItem:(id)view2{
    return @[[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeLeft equalToItem:view2],
             [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeRight equalToItem:view2],
             [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop equalToItem:view2],
             [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom equalToItem:view2]];
}

@end
