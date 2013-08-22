//
//  ZSimpleTextFieldCell.h
//  RegisterView
//
//  Created by Ayal Spitz on 8/7/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSimpleFormBaseCell.h"

typedef NS_ENUM(NSUInteger, ZSimpleTextFieldCellType){
    ZSimpleTextFieldCellEMailType,
    ZSimpleTextFieldCellPasswordType,
    ZSimpleTextFieldCellZipcodeType,
    ZSimpleTextFieldCellPhoneNumberType
};

@interface ZSimpleTextFieldCell : ZSimpleFormBaseCell <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

+ (ZSimpleTextFieldCell *)cellNamed:(NSString *)name withValue:(NSString *)value isSecured:(BOOL)secured keyboardType:(UIKeyboardType)keyboardType;
+ (ZSimpleTextFieldCell *)cellNamed:(NSString *)name withValue:(NSString *)value;
+ (ZSimpleTextFieldCell *)cellOfType:(ZSimpleTextFieldCellType)type withValue:(NSString *)value;

@end
