//
//  NSLayoutConstraint+Utilities.h
//  RegisterView
//
//  Created by Ayal Spitz on 8/7/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (Utilities)

+ (id)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attribute equalToItem:(id)view2;
+ (NSArray *)constraintsWithItem:(id)view1 equalToItem:(id)view2;

@end
