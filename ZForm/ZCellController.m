//
//  ZCellController.m
//  DateCell
//
//  Created by Ayal Spitz on 7/16/13.
//
//

#import "ZCellController.h"
#import "ZFormModel.h"
#import "ZTableViewCell.h"

#import "NSString+Utilities.h"
#import "NSIndexPath+Utilities.h"

@interface ZCellController ()

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) BOOL isSelectable;

@end

@implementation ZCellController

#pragma mark Init methods

- (id)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self setup];
    }
    return self;
}

- (void)setup{
    self.cell = [[ZTableViewCell alloc]initWithReuseIdentifier:[NSString UUID]];
    self.cellHeight = 44.0;
    self.isSelectable = YES;
}

#pragma mark - 

- (void)setText:(NSString *)text{
    ZTableViewCell *cell = (ZTableViewCell *)self.cell;
    [cell setLabelText:text];
}

- (void)setDetailText:(NSString *)text{
    ZTableViewCell *cell = (ZTableViewCell *)self.cell;
    [cell setDetailLabelText:text];
}

- (id)value{
    return [NSNull null];
}

#pragma mark -

- (void)setChildCellController:(ZCellController *)childCellController{
    _childCellController = childCellController;
    childCellController.parentCellController = self;
}

#pragma mark - React to table methods

- (void)selectInTableView:(UITableView *)tableView andModel:(ZFormModel *)model atIndexPath:(NSIndexPath *)indexPath{
    if (self.childCellController != nil){
        // the indexPath to the location where an item is to be inserted
        NSIndexPath *insertIndexPath = [indexPath indexPathOfRowWithDelta:1];
        [model insertObject:self.childCellController atIndex:insertIndexPath.row];
        [tableView insertRowsAtIndexPaths:@[insertIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)deselectFromTableView:(UITableView *)tableView andModel:(ZFormModel *)model atIndexPath:(NSIndexPath *)indexPath{
    if (self.childCellController != nil){
        // the item to be removed is 1 bellow the openItemIndexPath
        NSIndexPath *removeIndexPath = [indexPath indexPathOfRowWithDelta:1];
        // remove the item from the data store
        [model removeObjectAtIndex:removeIndexPath.row];
        // remove the item from the table
        [tableView deleteRowsAtIndexPaths:@[removeIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        // deselect the openItemItendPath
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)tappedInTableView:(UITableView *)tableView andModel:(ZFormModel *)model atIndexPath:(NSIndexPath *)indexPath{
}

@end
