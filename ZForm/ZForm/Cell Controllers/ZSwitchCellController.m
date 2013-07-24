//
//  ZSwitchCellController.m
//  ZForm
//
//  Created by Ayal Spitz on 7/21/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSwitchCellController.h"
#import "NSString+Utilities.h"

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

- (id)cellValue{
    return @(self.on);
}

- (void)tappedInTableView:(UITableView *)tableView andModel:(ZFormModel *)model atIndexPath:(NSIndexPath *)indexPath{
    self.on = !self.on;
}

@end
