//
//  ZTextFieldCellController.m
//  DateCell
//
//  Created by Ayal Spitz on 7/17/13.
//
//

#import "ZTextFieldCellController.h"
#import "NSString+Utilities.h"

@implementation ZTextFieldCellController

- (void)setup{
    [super setup];

    self.cell = [[ZTextFieldCell alloc]initWithReuseIdentifier:[NSString UUID]];
    self.cell.control.delegate = self;
}

- (void)setPlaceholder:(NSString *)placeholder{
    self.cell.placeholder = placeholder;
}

- (id)cellValue{
    return self.cell.control.text;
}

- (void)selectInTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    [self.cell.control becomeFirstResponder];
}

- (void)deselectFromTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    [self.cell.control resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(cellControllerWasSelected:)]){
        [self.delegate cellControllerWasSelected:self];
    }
}

@end
