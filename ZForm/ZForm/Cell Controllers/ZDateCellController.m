//
//  ZDateCellController.m
//  DateCell
//
//  Created by Ayal Spitz on 7/16/13.
//
//

#import "ZDateCellController.h"
#import "NSString+Utilities.h"

@interface ZDateSubcellController ()

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) BOOL isSelectable;
@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation ZDateSubcellController

- (void)setup{
    self.cell = [[ZDateCell alloc]initWithReuseIdentifier:[NSString UUID]];
    self.cellHeight = 216;
    self.isSelectable = NO;
    self.datePicker = self.cell.datePicker;
}

- (void)setDate:(NSDate *)date{ self.datePicker.date = date; }
- (NSDate *)date{ return self.datePicker.date; }

@end


@implementation ZDateCellController

- (void)setup{
    [super setup];
    
    self.childCellController = [[ZDateSubcellController alloc]init];
    self.date = self.childCellController.date;

    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [self.dateFormatter setTimeStyle:NSDateFormatterShortStyle];

    [self.childCellController.datePicker addTarget:self action:@selector(dateAction:) forControlEvents:UIControlEventValueChanged];\
}

- (void)setDate:(NSDate *)date{
    self.childCellController.date = date;
    [self setDetailText:[self.dateFormatter stringFromDate:date]];
}

- (NSDate *)date{
    return self.childCellController.date;
}

- (IBAction)dateAction:(UIDatePicker *)datePicker{
    self.date = datePicker.date;
}

- (id)value{
    return self.date;
}

@end
