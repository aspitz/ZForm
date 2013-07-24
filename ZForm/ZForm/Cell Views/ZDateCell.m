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
        self.datePicker = [[UIDatePicker alloc]init];
        [self.contentView addSubview:self.datePicker];
    }
    return self;
}

@end
