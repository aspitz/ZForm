//
//  ZSimpleFormViewController.h
//  RegisterView
//
//  Created by Ayal Spitz on 8/9/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SimpleFormButtonSide){
    SimpleFormButtonLeft,
    SimpleFormButtonRight
};

typedef void (^ZSimpleFormCompletionBlock)(SimpleFormButtonSide buttonType, NSArray *values);

@class ZSimpleFormModel;

@interface ZSimpleFormViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITableView *tableView;


+ (instancetype)formWithModel:(ZSimpleFormModel *)model andCompletionBlock:(ZSimpleFormCompletionBlock)complpetionBlock;
+ (void)presentModalFormOnTopOf:(UIViewController *)viewController withModel:(ZSimpleFormModel *)model andCompletionBlock:(ZSimpleFormCompletionBlock)completionBlock;

@end