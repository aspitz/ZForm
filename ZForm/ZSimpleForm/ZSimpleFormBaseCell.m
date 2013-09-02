//
//  ZSimpleFormBaseCell.m
//
//  Created by Ayal Spitz on 8/17/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSimpleFormBaseCell.h"
#import "ZFlag.h"

@interface ZSimpleFormBaseCell()

@property (nonatomic, strong) ZFlag *requiredFlag;

@end


@implementation ZSimpleFormBaseCell

- (id)init{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [self.contentView removeConstraints:self.contentView.constraints];
    
    self.requiredFlag = [[ZFlag alloc]init];
    self.requiredFlag.translatesAutoresizingMaskIntoConstraints = NO;
    self.requiredFlag.hidden = YES;
    [self.contentView addSubview:self.requiredFlag];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.requiredFlag
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.requiredFlag
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1.0
                                                                  constant:0.0]];
}

- (BOOL)isEmpty{ return NO;}

- (id)cellValue{ return nil; }

#pragma mark - Required flag methods

- (void)showRequiredFlag:(BOOL)show{
    self.requiredFlag.hidden = !show;
}

- (BOOL)isRequiredFlagHidden{
    return self.requiredFlag.hidden;
}

@end
