//
//  ZSimpleTextFieldCell.m
//  RegisterView
//
//  Created by Ayal Spitz on 8/7/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSimpleTextFieldCell.h"
#import "NSLayoutConstraint+Utilities.h"
#import "ZFlag.h"

@implementation ZSimpleTextFieldCell

- (void)setup{
    [super setup];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectZero];
    self.textField.delegate = self;
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.textField];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithItem:self.textField equalToItem:self.contentView]];
}

#pragma mark - Cell Factory

+ (ZSimpleTextFieldCell *)cellNamed:(NSString *)name withValue:(NSString *)value isSecured:(BOOL)secured keyboardType:(UIKeyboardType)keyboardType{
    ZSimpleTextFieldCell *cell = [[ZSimpleTextFieldCell alloc]init];
    cell.textField.textAlignment = NSTextAlignmentCenter;
    
    cell.textField.placeholder = name;
    cell.textField.text = value;
    cell.textField.secureTextEntry = secured;
    cell.textField.keyboardType = keyboardType;
    
    if ((keyboardType == UIKeyboardTypeEmailAddress) || secured){
        cell.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    }

    return cell;
}

+ (ZSimpleTextFieldCell *)cellNamed:(NSString *)name withValue:(NSString *)value{
    return [ZSimpleTextFieldCell cellNamed:name withValue:value isSecured:NO keyboardType:UIKeyboardTypeDefault];
}

+ (ZSimpleTextFieldCell *)cellOfType:(ZSimpleTextFieldCellType)type withValue:(NSString *)value{
    switch(type){
        case ZSimpleTextFieldCellEMailType:
            return [ZSimpleTextFieldCell cellNamed:@"eMail" withValue:value isSecured:NO keyboardType:UIKeyboardTypeEmailAddress];
        case ZSimpleTextFieldCellPasswordType:
            return [ZSimpleTextFieldCell cellNamed:@"Password" withValue:value isSecured:YES keyboardType:UIKeyboardTypeDefault];
        case ZSimpleTextFieldCellZipcodeType:
            return [ZSimpleTextFieldCell cellNamed:@"Zipcode" withValue:value isSecured:NO keyboardType:UIKeyboardTypeNumberPad];
        case ZSimpleTextFieldCellPhoneNumberType:
            return [ZSimpleTextFieldCell cellNamed:@"Phone Number" withValue:value isSecured:NO keyboardType:UIKeyboardTypeNumberPad];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSMutableString *textFieldText = [textField.text mutableCopy];
    
    [textFieldText replaceCharactersInRange:range withString:string];
    
    if ((textField.text.length == 0) && (textFieldText.length != 0) && (self.requiredFlagHidden == NO)){
        self.requiredFlagHidden = YES;
    }
    
    return YES;
}

#pragma mark - ZBaseFormCell methods

- (BOOL)isEmpty{ return (self.textField.text.length == 0); }
- (id)cellValue{ return self.textField.text; }

@end
