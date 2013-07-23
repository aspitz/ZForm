//
//  ZDateCellController.h
//  DateCell
//
//  Created by Ayal Spitz on 7/16/13.
//
//

#import "ZCellController.h"
#import "ZDateCell.h"

@interface ZDateSubcellController : ZCellController

@property (nonatomic, strong) ZDateCell *cell;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, readonly) UIDatePicker *datePicker;

@end

@interface ZDateCellController : ZCellController

@property (nonatomic, strong) ZDateSubcellController *childCellController;

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end
