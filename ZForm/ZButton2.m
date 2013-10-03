//
//  ZButton2.m
//  SimpleForm
//
//  Created by Ayal Spitz on 9/30/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZButton2.h"

@implementation ZButton2

- (instancetype)initWithTitle:(NSString *)title{
    self = [super init];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = [UIColor lightGrayColor];

        self.layer.cornerRadius = 5.0;
        self.layer.borderWidth = 0.5;
        self.layer.masksToBounds = YES;
        
        [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];
    self.layer.borderColor = [backgroundColor CGColor];
}

- (IBAction)buttonPressed:(id)sender{
    if (self.buttonPressBlock){
        self.buttonPressBlock(self);
    }
}

@end
