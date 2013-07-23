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
    ZFOrmModelCheckboxElement
};

@interface ZFormModel : NSObject <ZCellControllerDelegate>

@property (nonatomic, weak) NSObject<ZCellControllerDelegate> *delegate;

+ (instancetype)model;

- (void)add:(ZFormElementType)elementType withTitle:(NSString *)title;

- (void)addTextFieldWithTitle:(NSString *)title andPlaceholder:(NSString *)placeholder;
- (void)addDateWithTitle:(NSString *)title andDate:(NSDate *)date;
- (void)addSwitchWithTitle:(NSString *)title andOn:(BOOL)on;
- (void)addCheckboxWithTitle:(NSString *)title andChecked:(BOOL)checked;
- (void)addTitle:(NSString *)title andDetail:(NSString *)detail;

- (void)addMultiSelectWithTitle:(NSString *)title options:(NSArray *)options andSelectedOptions:(NSArray *)selectedOptions;
- (void)addMultiSelectWithTitle:(NSString *)title andOptions:(NSArray *)options;

- (NSUInteger)count;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (void)addObject:(id)anObject;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)anObject;

- (NSArray *)values;

@end
