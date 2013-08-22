//
//  ZButton.m
//
//  Created by Ayal Spitz on 8/21/13.
//  Copyright (c) 2013 spitz. All rights reserved.
//

#import "ZButton.h"

@interface ZButton ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ZButton

- (instancetype)initWithTitle:(NSString *)title andImage:(UIImage *)image aligned:(ZImageAlignment)aligned{
    self = [super init];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.label = [[UILabel alloc]init];
        self.label.textColor = self.tintColor;
        self.label.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.label];
        
        self.imageView = [[UIImageView alloc]initWithImage:nil];
        self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.imageView];
        
        [self removeConstraints:self.constraints];
        
        NSString *constraintVisualFormat = nil;
        switch (aligned) {
            case ZImageAlignmentLeft:
                constraintVisualFormat = @"H:|[buttonImageView]-[buttonLabel]|";
                break;
            case ZImageAlignmentRight:
                constraintVisualFormat = @"H:|[buttonLabel]-[buttonImageView]|";
                break;
        }
        
        NSDictionary *viewDictionary = @{@"buttonLabel":self.label, @"buttonImageView":self.imageView};
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:constraintVisualFormat
                                                                     options:0
                                                                     metrics:nil
                                                                       views:viewDictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[buttonImageView]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:viewDictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[buttonLabel]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:viewDictionary]];
        
        self.title = title;
        self.image = image;
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    self.label.text = title;
    [self sizeToFit];
}

- (NSString *)title{
    return self.label.text;
}

- (void)setImage:(UIImage *)image{
    self.imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.imageView.tintColor = self.tintColor;
    [self sizeToFit];
    
    _image = image;
}

- (void)sizeToFit{
    CGRect frame = self.frame;
    frame.size = [self intrinsicContentSize];
    self.frame = frame;
    
    [self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize{
    [self.label sizeToFit];
    [self.imageView sizeToFit];
    
    CGSize newSize = CGSizeZero;
    newSize.width = self.label.frame.size.width + self.imageView.frame.size.width;
    newSize.height = MAX(self.label.frame.size.height, self.imageView.frame.size.height);
    
    return newSize;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.alpha = 0.25;
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    self.alpha = 1.0;
    [self setNeedsDisplay];
    
    UITouch *touch = [touches allObjects][0];
    CGPoint touchPt = [touch locationInView:self];
    BOOL touchUpInsideButton = [self pointInside:touchPt withEvent:nil];
    if ((touchUpInsideButton) && (self.buttonPressBlock)){
        self.buttonPressBlock(self);
    }
}

@end
