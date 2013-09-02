//
//  ZDrawView.m
//
//  Created by Ayal Spitz on 9/1/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZDrawView.h"

@implementation ZDrawView

#pragma mark - Init methods

- (instancetype)initWithBlock:(DrawBlock)block{
    self = [super init];
    if (self){
        self.drawBlock = block;
    }
    
    return self;
}

+ (instancetype)viewWithBlock:(DrawBlock)block{
    return [[[self class]alloc]initWithBlock:block];
}


#pragma mark - Horizontal line methods

+ (instancetype)horizontalLine{
    return [[self class]horizontalLineWithColor:[UIColor darkGrayColor]];
}

+ (instancetype)horizontalLineWithColor:(UIColor *)lineColor{
    return [[[self class]alloc]initWithBlock:^(CGContextRef currentContext, CGRect drawRect, UIView *selfView) {
        [lineColor setStroke];
        CGContextMoveToPoint(currentContext, drawRect.origin.x, drawRect.origin.y);
        CGContextAddLineToPoint(currentContext, drawRect.origin.x + drawRect.size.width, drawRect.origin.y);
        CGContextStrokePath(currentContext);
    }];
}

#pragma mark - Vertical line

+ (instancetype)verticalLine{
    return [[self class]verticalLineWithColor:[UIColor darkGrayColor]];
}

+ (instancetype)verticalLineWithColor:(UIColor *)lineColor{
    return [[[self class]alloc]initWithBlock:^(CGContextRef currentContext, CGRect drawRect, UIView *selfView) {
        [lineColor setStroke];
        CGContextMoveToPoint(currentContext, drawRect.origin.x, drawRect.origin.y);
        CGContextAddLineToPoint(currentContext, drawRect.origin.x, drawRect.origin.y + drawRect.size.height);
        CGContextStrokePath(currentContext);
    }];
}

#pragma mark - drawRect method

- (void)drawRect:(CGRect)drawRect{
    [super drawRect:drawRect];
    
    if (self.drawBlock != nil){
        self.drawBlock(UIGraphicsGetCurrentContext(), drawRect, self);
    }
}

@end
