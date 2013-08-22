//
//  ZFlag.m
//  RegisterView
//
//  Created by Ayal Spitz on 8/13/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZFlag.h"

@implementation ZFlag

- (id)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor clearColor];
    _intrinsicContentSize = CGSizeMake(33.0, 33.0);
}

- (CGSize)intrinsicContentSize{
    return _intrinsicContentSize;
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, rect.size.width, 0.0);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextClosePath(context);
    
    [[UIColor redColor] setFill];
    CGContextFillPath(context);

    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1, -1);
    [[UIColor whiteColor] setFill];
    CGContextSelectFont(context, "HelveticaNeue-Bold", 16.0, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextShowTextAtPoint(context, 20.0, 18.0, "!", 1);
}

@end
