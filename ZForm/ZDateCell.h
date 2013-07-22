//
//  ZDateCell.h
//  DateCell
//
//  Created by Ayal Spitz on 7/16/13.
//
//

#import <UIKit/UIKit.h>

@interface ZDateCell : UITableViewCell

@property (nonatomic, strong) UIDatePicker *datePicker;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
