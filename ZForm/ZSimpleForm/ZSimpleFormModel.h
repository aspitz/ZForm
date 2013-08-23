//
//  ZSimpleFormModel.h
//  RegisterView
//
//  Created by Ayal Spitz on 8/8/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSimpleTextFieldCell.h"

typedef NS_ENUM(NSUInteger,ZSimpleFormElementType){
    ZSimpleFormElementEMailType = ZSimpleTextFieldCellEMailType,
    ZSimpleFormElementPasswordType = ZSimpleTextFieldCellPasswordType,
    ZSimpleFormElementZipcodeType = ZSimpleTextFieldCellZipcodeType,
    ZSimpleFormElementPhoneNumberType = ZSimpleTextFieldCellPhoneNumberType
};

#define REQUIRED_KEY @"requiredKey"
#define SECURED_KEY @"securedKey"
#define KEYBOARD_KEY @"keyboardKey"

@interface ZSimpleFormModel : NSObject <UITableViewDataSource>

@property (copy) NSString *leftButtonTitle;
@property (copy) NSString *rightButtonTitle;
@property (nonatomic, strong) UIImage *leftButtonImage;
@property (nonatomic, strong) UIImage *rightButtonImage;

+ (instancetype)model;

- (NSArray *)values;
- (BOOL)hasUnfilledRequiredCells;
- (void)clearRequiredFlags;

- (void)addCell:(ZSimpleTextFieldCell *)cell isRequired:(BOOL)required;
- (void)add:(ZSimpleFormElementType)elementType withValue:(NSString *)value isRequired:(BOOL)isRequired;
- (void)addElementTitled:(NSString *)title andValue:(NSString *)value withAttributes:(NSDictionary *)attributes;

@end
