//
//  ZCircularButton.m
//
//  Created by Ayal Spitz on 9/2/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZCircularButton.h"
#import "ZChevronImages.h"

@implementation ZCircularButton

- (instancetype)initWithImage:(UIImage *)image{
    self = [super initWithFrame:CGRectMake(0.0, 0.0, 44.0, 44.0)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setImage:image forState:UIControlStateNormal];
    }
    return self;
}

+ (instancetype)buttonWithImage:(UIImage *)image{
    return [[[self class]alloc]initWithImage:image];
}

- (void)drawRect:(CGRect)drawRect{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    [[UIColor lightGrayColor]setStroke];
    CGRect rect = CGRectInset(drawRect, 1, 1);
    CGContextStrokeEllipseInRect(currentContext, rect);
    [[UIColor colorWithWhite:1.0 alpha:0.95]setFill];
    CGContextFillEllipseInRect(currentContext, rect);
}

- (CGSize)intrinsicContentSize{
    return CGSizeMake(44.0, 44.0);
}

@end
