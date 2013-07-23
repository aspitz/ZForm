//
//  ZSwitchCellController.h
//  ZForm
//
//  Created by Ayal Spitz on 7/21/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZCellController.h"
#import "ZSwitchCell.h"

@interface ZSwitchCellController : ZCellController

@property (nonatomic, strong) ZSwitchCell *cell;
@property (nonatomic, assign) BOOL on;

@end
