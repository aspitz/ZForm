//
//  ZSwitchCell.h
//
//  Created by Ayal Spitz on 6/26/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZLabelControlCell.h"

@interface ZSwitchCell : ZLabelControlCell

@property (nonatomic, strong) UISwitch *control;

- (void)setOn:(BOOL)on;
- (BOOL)on;

@end
