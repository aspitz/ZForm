//
//  ZSimpleTextFieldCell.m
//
//  Created by Ayal Spitz on 8/7/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSimpleTextFieldCell.h"
#import "ZFlag.h"

@implementation ZSimpleTextFieldCell

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [super setup];
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectZero];
    self.textField.delegate = self;
    self.textField.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.textField];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:8.0]];
     [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                                  attribute:NSLayoutAttributeRight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.contentView
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1.0
                                                                   constant:-8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.textField
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:0.0]];
}

#pragma mark - Cell Factory

+ (ZSimpleTextFieldCell *)cellFromDictionary:(NSDictionary *)srcDictionary{
    ZSimpleTextFieldCell *cell = [[ZSimpleTextFieldCell alloc]init];
    [cell setFromDictionary:srcDictionary];
    
    return cell;
}

- (void)setFromDictionary:(NSDictionary *)srcDictionary{
    NSNumber *type = srcDictionary[TYPE_KEY];
    if (type != nil){
        NSMutableDictionary *dictionary = [srcDictionary mutableCopy];
        ZSimpleTextFieldCellType cellType = (ZSimpleTextFieldCellType)[type integerValue];
        switch(cellType){
            case ZSimpleTextFieldCellEMailType:
                [dictionary addEntriesFromDictionary:@{TITLE_KEY:@"eMail", KEYBOARD_KEY:@(UIKeyboardTypeEmailAddress)}];
                break;
            case ZSimpleTextFieldCellPasswordType:
                [dictionary addEntriesFromDictionary:@{TITLE_KEY:@"Password", SECURED_KEY:@YES}];
                break;
            case ZSimpleTextFieldCellZipcodeType:
                [dictionary addEntriesFromDictionary:@{TITLE_KEY:@"Zipcode", KEYBOARD_KEY:@(UIKeyboardTypeNumberPad)}];
                break;
            case ZSimpleTextFieldCellPhoneNumberType:
                [dictionary addEntriesFromDictionary:@{TITLE_KEY:@"Phone Number", KEYBOARD_KEY:@(UIKeyboardTypeNumberPad)}];
                break;
        }
        [dictionary removeObjectForKey:TYPE_KEY];
        srcDictionary = dictionary;
    }

    self.textField.placeholder = srcDictionary[TITLE_KEY];
    self.textField.text = srcDictionary[VALUE_KEY];
    self.textField.secureTextEntry = [srcDictionary[SECURED_KEY] boolValue];
    
    NSNumber *value = nil;
    value = srcDictionary[KEYBOARD_KEY];
    self.textField.keyboardType = value == nil ? UIKeyboardTypeDefault : (UIKeyboardType)[value integerValue];
    
    if ((self.textField.keyboardType == UIKeyboardTypeEmailAddress) || self.textField.secureTextEntry){
        self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    }
    
    value = srcDictionary[TEXT_ALIGNMENT_KEY];
    self.textField.textAlignment = value == nil ? NSTextAlignmentLeft : (NSTextAlignment)[value integerValue];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSMutableString *textFieldText = [textField.text mutableCopy];
    
    [textFieldText replaceCharactersInRange:range withString:string];
    
    if ((textField.text.length == 0) && (textFieldText.length != 0) && (self.isRequiredFlagHidden == NO)){
        self.showRequiredFlag = YES;
    }
    
    return YES;
}

#pragma mark - ZBaseFormCell methods

- (BOOL)isEmpty{ return (self.textField.text.length == 0); }
- (id)cellValue{ return self.textField.text; }

@end
