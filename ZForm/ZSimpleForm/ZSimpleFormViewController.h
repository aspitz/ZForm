//
//  ZSimpleFormViewController.h
//
//  Created by Ayal Spitz on 8/27/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZSimpleFormModel;

@interface ZSimpleFormViewController : UIViewController <UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) ZSimpleFormModel *model;
@property (nonatomic, assign) BOOL showRequiredFlags;

- (BOOL)hasUnfulfilledRequiredElements;
- (void)flagUnfulfilledRequiredElements;
- (NSArray *)unfulfilledRequiredCellIndexPaths;

- (NSArray *)allValues;

- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

@end
