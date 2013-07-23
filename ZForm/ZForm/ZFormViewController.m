//
//  ZFormViewController.h
//
//  Created by Ayal Spitz on 7/10/13.
//
//

#import "ZFormViewController.h"
#import "TransactionalArray.h"
#import "ZDateCellController.h"
#import "ZTextFieldCellController.h"
#import "ZFormModel.h"

#import "NSIndexPath+Utilities.h"

@interface ZFormViewController ()

@property (nonatomic, strong) ZFormModel *model;
@property (nonatomic, strong) NSIndexPath *openItemIndexPath;

@end


#pragma mark -

@implementation ZFormViewController

+ (instancetype)formWithName:(NSString *)title model:(ZFormModel *)model andCompletionBlock:(FormCompletionBlock)complpetionBlock{
    ZFormViewController *form = [[[self class]alloc]init];
    form.title = title;
    form.model = model;
    form.model.delegate = form;
    form.completionBlock = complpetionBlock;

    return form;
}

+ (UINavigationController *)modalFormWithName:(NSString *)title model:(ZFormModel *)model andCompletionBlock:(FormCompletionBlock)complpetionBlock{
    ZFormViewController *form = [ZFormViewController formWithName:title model:model andCompletionBlock:complpetionBlock];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:form];
    
    form.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                         target:form
                                                                                         action:@selector(cancel:)];
    
    form.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                          target:form
                                                                                          action:@selector(done:)];
    
    return navigationController;
}

- (ZFormModel *)model{
    if (_model == nil){
        _model = [ZFormModel model];
        _model.delegate = self;
    }
    
    return _model;
}

#pragma mark - Modal actions
- (IBAction)done:(id)sender{
    if (self.completionBlock != nil){
        self.completionBlock(NO, self.model);
    }
}

- (IBAction)cancel:(id)sender{
    if (self.completionBlock != nil){
        self.completionBlock(YES, self.model);
    }
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZCellController *cellController = self.model[indexPath.row];
    return cellController.cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZCellController *cellController = self.model[indexPath.row];
    return cellController.cellHeight;
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // close any open items
    ZCellController *openCellController = nil;
    if (self.openItemIndexPath != nil){
        openCellController = self.model[self.openItemIndexPath.row];
        [openCellController deselectFromTableView:tableView andModel:self.model atIndexPath:self.openItemIndexPath];
    }
    
    
    // if we removed an item and it's before the selected item...
    NSInteger delta = 0;
    if ((openCellController != nil) && [self.openItemIndexPath isBefore:indexPath] && (openCellController.childCellController != nil)){
        // ... account for the removed item
        delta = -1;
    }
    
    // the new item to open, accounting for the delta
    self.openItemIndexPath = [indexPath indexPathOfRowWithDelta:delta];
    ZCellController *toOpenCellController = self.model[self.openItemIndexPath.row];
    [toOpenCellController tappedInTableView:tableView andModel:self.model atIndexPath:self.openItemIndexPath];
    
    // make sure that the item being opened isn't that same we just closed
    if (openCellController != toOpenCellController){
        [toOpenCellController selectInTableView:tableView andModel:self.model atIndexPath:self.openItemIndexPath];
    } else {
        self.openItemIndexPath = nil;
    }
}

#pragma mark - ZCellControllerDelegate methods

- (void)cellControllerWasSelected:(ZCellController *)cellController{
    NSUInteger index = [self.model indexOfObject:cellController];
    self.openItemIndexPath = [NSIndexPath indexPathForRow:index inSection:0];
}

- (void)cellController:(ZCellController *)cellController pushViewController:(UIViewController *)viewController{
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - UIViewControllerNavigationExtension methods
- (BOOL)shouldPop{

    if (self.completionBlock != nil){
        self.completionBlock(YES, self.model);
    }
    
    return YES;
}

@end

