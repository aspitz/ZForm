//
//  ZCheckboxCellController.m
//  ZForm
//
//  Created by Ayal Spitz on 7/21/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZCheckboxCellController.h"
#import "NSString+Utilities.h"

@interface ZCheckboxCellController ()

@end

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

- (id)value{
    return @(self.isChecked);
}

- (void)selectInTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    self.checked = !self.isChecked;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)deselectFromTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    // deselect the openItemItendPath
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
