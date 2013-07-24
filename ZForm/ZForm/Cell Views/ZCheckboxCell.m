//
//  ZCheckboxCell.m
//  ZForm
//
//  Created by Ayal Spitz on 7/21/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZCheckboxCell.h"
#import "ZCheckbox.h"

@implementation ZCheckboxCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setLabelText:@""];

        self.control = [ZCheckbox checkbox];
        self.leftView = self.control;
        self.rightView = self.label;
        
        // limit the size of the label to 100 pixels
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.control
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0                                                                      constant:28.0]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setChecked:(BOOL)checked{
    self.control.checked = checked;
}

- (BOOL)isChecked{
    return self.control.isChecked;
}

@end
