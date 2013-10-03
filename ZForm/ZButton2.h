//
//  ZButton2.h
//  SimpleForm
//
//  Created by Ayal Spitz on 9/30/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZButton2 : UIButton

@property (nonatomic, copy) void(^buttonPressBlock)(ZButton2 *srcButton);

- (instancetype)initWithTitle:(NSString *)title;

@end
