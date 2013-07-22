//
//  ZCheckboxCell.h
//  ZForm
//
//  Created by Ayal Spitz on 7/21/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZLabelControlCell.h"
#import "ZCheckbox.h"

@interface ZCheckboxCell : ZLabelControlCell

@property (nonatomic, strong) ZCheckbox *control;

- (void)setChecked:(BOOL)checked;
- (BOOL)isChecked;

@end
