//
//  ZSimpleFormBaseCell.h
//  RegisterView
//
//  Created by Ayal Spitz on 8/17/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSimpleFormBaseCell : UITableViewCell

@property (assign) BOOL requiredFlagHidden;

- (void)setup;

- (BOOL)isEmpty;
- (id)cellValue;

@end
