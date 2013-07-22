//
//  ZSwitchCellController.m
//  ZForm
//
//  Created by Ayal Spitz on 7/21/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSwitchCellController.h"
#import "NSString+Utilities.h"

@interface ZSwitchCellController ()

@end

@implementation ZSwitchCellController

- (void)setup{
    [super setup];
    
    self.cell = [[ZSwitchCell alloc]initWithReuseIdentifier:[NSString UUID]];
}

- (void)setOn:(BOOL)on{
    self.cell.on = on;
}

- (BOOL)on{
    return self.cell.on;
}

- (id)value{
    return @(self.on);
}

- (void)selectInTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    self.on = !self.on;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)deselectFromTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    // deselect the openItemItendPath
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
