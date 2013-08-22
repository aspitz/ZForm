//
//  ZSimpleFormView.h
//  RegisterView
//
//  Created by Ayal Spitz on 8/8/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZButton;
@interface ZSimpleFormView : UIView

@property (nonatomic, strong) ZButton *rightButton;
@property (nonatomic, strong) ZButton *leftButton;
@property (nonatomic, assign) UIEdgeInsets contentInset;

- (void)setLeftButtonTitle:(NSString *)title andImage:(UIImage *)image;
- (void)setRightButtonTitle:(NSString *)title andImage:(UIImage *)image;

- (void)setDataSource:(id<UITableViewDataSource>)dataSource;

@end
