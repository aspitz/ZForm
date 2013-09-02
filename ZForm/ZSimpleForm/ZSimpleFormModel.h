//
//  ZSimpleFormModel.h
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

@interface ZSimpleFormModel : NSObject

@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, assign) NSTextAlignment defaultTextAlignment;

+ (instancetype)model;

- (void)add:(NSDictionary *)elementDictionary;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)setValue:(NSString *)value forIndex:(NSUInteger)idx;
- (NSArray *)allValues;

- (NSIndexSet *)unfulfilledRequiredElements;
- (BOOL)hasUnfulfilledRequiredElements;
- (BOOL)isUnfulfilledRequiredElementAtIndex:(NSUInteger)idx;

@end
