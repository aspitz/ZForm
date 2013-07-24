//
//  ZFormViewController.h
//
//  Created by Ayal Spitz on 7/10/13.
//
//

#import <UIKit/UIKit.h>
#import "ZCellController.h"
#import "UINavigationController+InterceptBack.h"

@class ZFormModel;

typedef void (^FormCompletionBlock)(bool cancel, ZFormModel *model);

@interface ZFormViewController : UITableViewController <ZCellControllerDelegate, UIViewControllerNavigationExtension>

+ (instancetype)formWithModel:(ZFormModel *)model andCompletionBlock:(FormCompletionBlock)complpetionBlock;
+ (UINavigationController *)modalFormWithModel:(ZFormModel *)model andCompletionBlock:(FormCompletionBlock)complpetionBlock;
+ (void)presentModalFormOnTopOf:(UIViewController *)viewController withModel:(ZFormModel *)model andCompletionBlock:(FormCompletionBlock)completionBlock;

@end
