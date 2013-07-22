//
//  ZCellController.h
//  DateCell
//
//  Created by Ayal Spitz on 7/16/13.
//
//

#import <UIKit/UIKit.h>

@class ZFormModel;
@class ZCellController;
@class ZTableViewCell;

@protocol ZCellControllerDelegate
- (void)cellControllerWasSelected:(ZCellController *)cellController;
- (void)cellController:(ZCellController *)cellController pushViewController:(UIViewController *)viewController;
@end

@interface ZCellController : UIViewController

@property (nonatomic, weak) NSObject<ZCellControllerDelegate> *delegate;
@property (nonatomic, strong) UITableViewCell *cell;

@property (nonatomic, weak) ZCellController *parentCellController;
@property (nonatomic, strong) ZCellController *childCellController;

@property (nonatomic, readonly) CGFloat cellHeight;
@property (nonatomic, readonly) BOOL isSelectable;

@property (nonatomic, readonly) id value;

- (void)setup;

- (void)setText:(NSString *)text;
- (void)setDetailText:(NSString *)text;

- (void)selectInTableView:(UITableView *)tableView andModel:(ZFormModel *)model atIndexPath:(NSIndexPath *)indexPath;
- (void)deselectFromTableView:(UITableView *)tableView andModel:(ZFormModel *)model atIndexPath:(NSIndexPath *)indexPath;
- (void)tappedInTableView:(UITableView *)tableView andModel:(ZFormModel *)model atIndexPath:(NSIndexPath *)indexPath;

@end
