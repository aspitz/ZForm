//
//  ZLabelControlCell.h
//
//  Created by Ayal Spitz on 7/2/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZTableViewCell.h"

@interface ZLabelControlCell : ZTableViewCell

@property (nonatomic, strong) UIControl *control;

- (id)initWithControl:(UIControl *)control andReuseIdentifier:(NSString *)reuseIdentifier;

@end
