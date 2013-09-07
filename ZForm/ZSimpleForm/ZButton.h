//
//  ZButton.h
//
//  Created by Ayal Spitz on 8/21/13.
//  Copyright (c) 2013 spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZImageAlignment){
    ZImageAlignmentLeft,
    ZImageAlignmentRight
};

@interface ZButton : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) UIImage *image;
@property (nonatomic, assign) ZImageAlignment imageAlignment;
@property (nonatomic, copy) void(^buttonPressBlock)(ZButton *srcButton);


- (instancetype)initWithTitle:(NSString *)title andImage:(UIImage *)image aligned:(ZImageAlignment)aligned;

@end
