//
//  ZSwitchCell.m
//
//  Created by Ayal Spitz on 6/26/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSwitchCell.h"
#import "ZLabelControlCell.h"

@implementation ZSwitchCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithControl:[[UISwitch alloc]initWithFrame:CGRectZero] andReuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)setOn:(BOOL)on{
    self.control.on = on;
}

- (BOOL)on{
    return self.control.on;
}

@end
