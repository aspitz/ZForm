//
//  ZLabelControlCell.m
//
//  Created by Ayal Spitz on 7/2/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZLabelControlCell.h"

@implementation ZLabelControlCell

- (id)initWithControl:(UIControl *)control andReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.control = control;
        self.rightView = self.control;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

@end
