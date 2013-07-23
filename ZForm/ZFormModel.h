//
//  ZFormModel.h
//  ZForm
//
//  Created by Ayal Spitz on 7/20/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCellController.h"

@interface ZFormModel : NSObject <ZCellControllerDelegate>

@property (nonatomic, weak) NSObject<ZCellControllerDelegate> *delegate;

+ (instancetype)model;

- (void)addTextFieldWithTitle:(NSString *)title andPlaceholder:(NSString *)placeholder;
- (void)addTextFieldWithTitle:(NSString *)title;

- (void)addDateWithTitle:(NSString *)title andDate:(NSDate *)date;
- (void)addDateWithTitle:(NSString *)title;

- (void)addSwitchWithTitle:(NSString *)title andOn:(BOOL)on;
- (void)addSwitchWithTitle:(NSString *)title;

- (void)addCheckboxWithTitle:(NSString *)title andChecked:(BOOL)checked;
- (void)addCheckboxWithTitle:(NSString *)title;

- (void)addTitle:(NSString *)title andDetail:(NSString *)detail;
- (void)addTitle:(NSString *)title;

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
