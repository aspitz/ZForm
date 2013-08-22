//
//  ZTextFieldCellController.h
//  DateCell
//
//  Created by Ayal Spitz on 7/17/13.
//
//

#import "ZCellController.h"
#import "ZTextFieldCell.h"

@interface ZTextFieldCellController : ZCellController <UITextFieldDelegate>

@property (nonatomic, strong) ZTextFieldCell *cell;

- (void)setPlaceholder:(NSString *)placeholder;
- (void)setSecret:(BOOL)secret;

@end
