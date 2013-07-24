//
//  ZDateCell.h
//  DateCell
//
//  Created by Ayal Spitz on 7/16/13.
//
//

#import "ZTableViewCell.h"

@interface ZDateCell : ZTableViewCell

@property (nonatomic, strong) UIDatePicker *datePicker;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
