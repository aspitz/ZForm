//
//  ZTableViewCell.h
//  CellLayoutTest
//
//  Created by Ayal Spitz on 6/26/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *detailLabel;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

- (void)setLabelText:(NSString *)label;
- (void)setDetailLabelText:(NSString *)detail;

@end
