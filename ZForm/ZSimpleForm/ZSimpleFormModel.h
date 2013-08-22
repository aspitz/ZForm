//
//  ZSimpleFormModel.h
//  RegisterView
//
//  Created by Ayal Spitz on 8/8/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSimpleTextFieldCell.h"

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

@end
