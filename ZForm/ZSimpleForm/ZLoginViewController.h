//
//  ZLoginViewController.h
//  NavButtonSnoop
//
//  Created by Ayal Spitz on 8/21/13.
//  Copyright (c) 2013 spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLoginViewController : UIViewController

@property (nonatomic, copy) void (^doneButton)(void);

@end
