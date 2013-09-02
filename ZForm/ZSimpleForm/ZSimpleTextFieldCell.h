//
//  ZSimpleTextFieldCell.h
//
//  Created by Ayal Spitz on 8/7/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSimpleFormBaseCell.h"

#define SECURED_KEY @"securedKey"
#define KEYBOARD_KEY @"keyboardKey"
#define VALUE_KEY @"valueKey"
#define TYPE_KEY @"typeKey"
#define TITLE_KEY @"titleKey"
#define TEXT_ALIGNMENT_KEY @"textAlignmentKey"

typedef NS_ENUM(NSUInteger, ZSimpleTextFieldCellType){
    ZSimpleTextFieldCellEMailType,
    ZSimpleTextFieldCellPasswordType,
    ZSimpleTextFieldCellZipcodeType,
    ZSimpleTextFieldCellPhoneNumberType
};

@interface ZSimpleTextFieldCell : ZSimpleFormBaseCell <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

+ (ZSimpleTextFieldCell *)cellFromDictionary:(NSDictionary *)dictionary;
- (void)setFromDictionary:(NSDictionary *)srcDictionary;

@end
