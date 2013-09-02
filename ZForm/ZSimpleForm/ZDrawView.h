//
//  ZDrawView.h
//
//  Created by Ayal Spitz on 9/1/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DrawBlock)(CGContextRef currentContext, CGRect drawRect, UIView *selfView);


@interface ZDrawView : UIView

@property (nonatomic, copy) DrawBlock drawBlock;

- (instancetype)initWithBlock:(DrawBlock)block;
+ (instancetype)viewWithBlock:(DrawBlock)block;

+ (instancetype)horizontalLine;
+ (instancetype)horizontalLineWithColor:(UIColor *)lineColor;

+ (instancetype)verticalLine;
+ (instancetype)verticalLineWithColor:(UIColor *)lineColor;

- (void)drawRect:(CGRect)drawRect;

@end
