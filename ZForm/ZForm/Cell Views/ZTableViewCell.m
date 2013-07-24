//
//  ZTableViewCell.m
//  CellLayoutTest
//
//  Created by Ayal Spitz on 6/26/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZTableViewCell.h"

@implementation ZTableViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    return [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
}

- (void)setLeftView:(UIView *)leftView{
    _leftView = leftView;
    _leftView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_leftView];
    
    [self setConstraints];
}

- (void)setRightView:(UIView *)rightView{
    _rightView = rightView;
    _rightView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_rightView];
    
    [self setConstraints];
}

- (void)setConstraints{
    [self.contentView removeConstraints:self.contentView.constraints];
    
    if (self.leftView != nil){
        // center left view verticaly
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.leftView
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeCenterY
                                                                    multiplier:1.0
                                                                      constant:0.0]];
        // alight the left view left side all the way to the left plus 15
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.self.leftView
                                                                     attribute:NSLayoutAttributeLeft
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeLeft
                                                                    multiplier:1.0
                                                                      constant:15.0]];
    }

    if (self.rightView != nil){
        // center left view verticaly
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.rightView
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeCenterY
                                                                    multiplier:1.0
                                                                      constant:0.0]];
        
        CGFloat padding = -15.0;
        if (self.accessoryType != UITableViewCellAccessoryNone){
            padding = 0.0;
        }
        // alight the left view left side all the way to the left plus 15
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.rightView
                                                                     attribute:NSLayoutAttributeRight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeRight
                                                                    multiplier:1.0
                                                                      constant:padding]];
    }

    if ((self.leftView != nil) && (self.rightView != nil)){
        // align the left views right side to be 8 pixels from the right view left side
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.leftView
                                                                     attribute:NSLayoutAttributeRight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.rightView
                                                                     attribute:NSLayoutAttributeLeft
                                                                    multiplier:1.0
                                                                      constant:-8.0]];
    }
}

- (void)setLabelText:(NSString *)label{
    if (self.label == nil){
        self.label = [[UILabel alloc]initWithFrame:CGRectZero];
        
        self.leftView = self.self.label;
    }
    
    self.label.text = label;
}

- (void)setDetailLabelText:(NSString *)detail{
    if (self.detailLabel == nil){
        self.detailLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.detailLabel.textColor = [UIColor lightGrayColor];

        self.rightView = self.detailLabel;
    }
    
    self.detailLabel.text = detail;
}

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType{
    [super setAccessoryType:accessoryType];
    [self setConstraints];
}

@end
