//
//  ZCheckboxCellController.m
//  ZForm
//
//  Created by Ayal Spitz on 7/21/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZCheckboxCellController.h"
#import "NSString+Utilities.h"

@implementation ZCheckboxCellController

- (void)setup{
    [super setup];
    
    self.cell = [[ZCheckboxCell alloc]initWithReuseIdentifier:[NSString UUID]];
}

- (void)setChecked:(BOOL)checked{
    self.cell.checked = checked;
}

- (BOOL)isChecked{
    return self.cell.isChecked;
}

- (id)cellValue{
    return @(self.isChecked);
}

- (void)tappedInTableView:(UITableView *)tableView andModel:(ZFormModel *)model atIndexPath:(NSIndexPath *)indexPath{
    self.checked = !self.isChecked;
}

@end
