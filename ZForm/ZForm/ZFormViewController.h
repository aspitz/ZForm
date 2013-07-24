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

@property (copy) FormCompletionBlock completionBlock;

+ (instancetype)formWithName:(NSString *)title model:(ZFormModel *)model andCompletionBlock:(FormCompletionBlock)complpetionBlock;
+ (UINavigationController *)modalFormWithName:(NSString *)title model:(ZFormModel *)model andCompletionBlock:(FormCompletionBlock)complpetionBlock;
+ (void)presentModalFormOnTopOf:(UIViewController *)viewController WithName:(NSString *)title model:(ZFormModel *)model andCompletionBlock:(FormCompletionBlock)completionBlock;

@end
