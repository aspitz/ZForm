//
//  ZSimpleFormModel.m
//  RegisterView
//
//  Created by Ayal Spitz on 8/8/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSimpleFormModel.h"
#import "ZSimpleTextFieldCell.h"

@interface ZSimpleFormModel ()

@property (nonatomic, strong) NSMutableArray *model;
@property (nonatomic, strong) NSMutableArray *required;

@end


@implementation ZSimpleFormModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.model = [NSMutableArray array];
        self.required = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)model{
    return [[[self class]alloc]init];
}

#pragma mark - Build Model methods

- (void)addCell:(ZSimpleTextFieldCell *)cell isRequired:(BOOL)required{
    [self.model addObject:cell];
    [self.required addObject:@(required)];
}

- (void)add:(ZSimpleFormElementType)elementType withValue:(NSString *)value isRequired:(BOOL)isRequired{
    ZSimpleTextFieldCellType cellType = (ZSimpleTextFieldCellType)elementType;
    ZSimpleTextFieldCell *cell = [ZSimpleTextFieldCell cellOfType:cellType withValue:value];
    [self addCell:cell isRequired:isRequired];
}

- (void)addElementTitled:(NSString *)title andValue:(NSString *)value withAttributes:(NSDictionary *)attributes{
    BOOL isRequired = [attributes[REQUIRED_KEY] boolValue];
    BOOL isSecured = [attributes[SECURED_KEY] boolValue];
    UIKeyboardType keyboardType = attributes[KEYBOARD_KEY] == nil ? UIKeyboardTypeDefault : [attributes[KEYBOARD_KEY] integerValue];
    
    ZSimpleTextFieldCell *cell = [ZSimpleTextFieldCell cellNamed:title withValue:value isSecured:isSecured keyboardType:keyboardType];
    [self addCell:cell isRequired:isRequired];
}

#pragma mark - Access elements methods

- (NSArray *)values{
    NSMutableArray *values = [NSMutableArray array];
    [self.model enumerateObjectsUsingBlock:^(ZSimpleTextFieldCell *cell, NSUInteger idx, BOOL *stop) {
        [values addObject:cell.cellValue];
    }];
    return values;
}

- (BOOL)hasUnfilledRequiredCells{
    __block BOOL hasUnfilledRequiredCells = NO;
    
    [self.model enumerateObjectsUsingBlock:^(ZSimpleTextFieldCell *cell, NSUInteger idx, BOOL *stop) {
        if (([self.required[idx] boolValue]) && [cell isEmpty]){
            cell.requiredFlagHidden = NO;
            hasUnfilledRequiredCells = YES;
        }
    }];

    return hasUnfilledRequiredCells;
}

- (void)clearRequiredFlags{
    [self.model enumerateObjectsUsingBlock:^(ZSimpleTextFieldCell *cell, NSUInteger idx, BOOL *stop) {
        cell.requiredFlagHidden = YES;
    }];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.model[indexPath.row];
}

@end
