//
//  ZDateCell.m
//  DateCell
//
//  Created by Ayal Spitz on 7/16/13.
//
//

#import "ZDateCell.h"

@implementation ZDateCell

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
    self.datePicker = [[UIDatePicker alloc]init];
    [self.contentView addSubview:self.datePicker];
}

@end
