//
//  ZTextFieldCell.m
//
//  Created by Ayal Spitz on 6/26/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZTextFieldCell.h"
#import "ZTextField.h"

@implementation ZTextFieldCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithControl:[ZTextField textField] andReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setLabelText:@""];

        // limit the size of the label to 100 pixels
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.label
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:100.0]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder{
    self.control.placeholder = placeholder;
}

@end
