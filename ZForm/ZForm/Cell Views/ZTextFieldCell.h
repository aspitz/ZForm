//
//  ZTextFieldTableViewCell.h
//
//  Created by Ayal Spitz on 6/26/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZLabelControlCell.h"
#import "ZTextField.h"

@interface ZTextFieldCell : ZLabelControlCell

@property (nonatomic, strong) ZTextField *control;

- (void)setPlaceholder:(NSString *)placeholder;
- (void)setSecret:(BOOL)secret;

@end
