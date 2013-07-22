//
//  ZFormViewController.h
//
//  Created by Ayal Spitz on 7/10/13.
//
//

#import <UIKit/UIKit.h>
#import "ZCellController.h"

@class ZFormModel;

typedef void (^FormCompletionBlock)(bool cancel, ZFormModel *model);

@interface ZFormViewController : UITableViewController <ZCellControllerDelegate>

@property (copy) FormCompletionBlock completionBlock;

+ (instancetype)formWithName:(NSString *)title andModel:(ZFormModel *)model;
+ (UINavigationController *)modalFormWithName:(NSString *)title model:(ZFormModel *)model andCompletionBlock:(FormCompletionBlock)complpetionBlock;

@end
