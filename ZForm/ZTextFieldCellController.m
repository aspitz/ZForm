//
//  ZTextFieldCellController.m
//  DateCell
//
//  Created by Ayal Spitz on 7/17/13.
//
//

#import "ZTextFieldCellController.h"
#import "NSString+Utilities.h"

@interface ZTextFieldCellController ()

@end

@implementation ZTextFieldCellController

- (void)setup{
    [super setup];

    self.cell = [[ZTextFieldCell alloc]initWithReuseIdentifier:[NSString UUID]];
    self.cell.control.delegate = self;
}

- (void)setPlaceholder:(NSString *)placeholder{
    self.cell.placeholder = placeholder;
}

- (id)value{
    return self.cell.control.text;
}

- (void)selectInTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    [self.cell.control becomeFirstResponder];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)deselectFromTableView:(UITableView *)tableView andModel:(NSMutableArray *)model atIndexPath:(NSIndexPath *)indexPath{
    [self.cell.control resignFirstResponder];
    // deselect the openItemItendPath
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ((self.delegate != nil) && [self.delegate respondsToSelector:@selector(cellControllerWasSelected:)]){
        [self.delegate cellControllerWasSelected:self];
    }
}

@end
