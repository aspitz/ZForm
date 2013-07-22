//
//  ZMultiSelectCellController.h
//  ZForm
//
//  Created by Ayal Spitz on 7/22/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZCellController.h"

@interface ZMultiSelectCellController : ZCellController

@property (nonatomic, strong) NSArray *options;
@property (nonatomic, strong) NSArray *selectedOptions;

@end
