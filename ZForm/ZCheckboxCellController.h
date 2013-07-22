//
//  ZCheckboxCellController.h
//  ZForm
//
//  Created by Ayal Spitz on 7/21/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZCellController.h"
#import "ZCheckboxCell.h"

@interface ZCheckboxCellController : ZCellController

@property (nonatomic, strong) ZCheckboxCell *cell;
@property (nonatomic, assign, getter = isChecked) BOOL checked;

@end
