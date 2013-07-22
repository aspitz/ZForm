//
//  ZTextField.h
//
//  Created by Ayal Spitz on 7/1/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTextField : UITextField

@property (nonatomic, assign) float verticalPadding;
@property (nonatomic, assign) float horizontalPadding;

+ (instancetype)textField;

@end
