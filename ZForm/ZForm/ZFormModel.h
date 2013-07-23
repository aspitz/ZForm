//
//  ZFormModel.h
//  ZForm
//
//  Created by Ayal Spitz on 7/20/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCellController.h"

typedef NS_ENUM(NSUInteger,ZFormElementType){
    ZFormModelTextElement,
    ZFormModelTextFieldElement,
    ZFormModelDateElement,
    ZFormModelSwitchElement,
    ZFormModelMultiSelectElement,
    ZFormModelCheckboxElement
};

@interface ZFormModel : NSObject <ZCellControllerDelegate>

@property (nonatomic, weak) NSObject<ZCellControllerDelegate> *delegate;

+ (instancetype)model;

- (void)add:(ZFormElementType)elementType withTitle:(NSString *)title;
- (void)add:(ZFormElementType)elementType withTitle:(NSString *)title andAttributes:(NSDictionary *)attributes;

- (NSUInteger)count;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)addObject:(id)anObject;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)anObject;

- (NSArray *)values;

@end
