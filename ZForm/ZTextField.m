//
//  ZTextField.m
//
//  Created by Ayal Spitz on 7/1/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZTextField.h"

@implementation ZTextField

+ (instancetype)textField{
    return [[[self class]alloc]initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.layer.backgroundColor = [[UIColor lightGrayColor]CGColor];

        self.translatesAutoresizingMaskIntoConstraints = NO;

        self.horizontalPadding = 5.0;
        self.verticalPadding = 2.0;
    }
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + self.horizontalPadding, bounds.origin.y + self.verticalPadding,
                      bounds.size.width - self.horizontalPadding*2, bounds.size.height - self.verticalPadding*2);
}
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

- (void)setPlaceholder:(NSString *)placeholder{
    NSDictionary *attrsDictionary = @{NSFontAttributeName: self.font, NSForegroundColorAttributeName: [UIColor whiteColor]};
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:placeholder attributes:attrsDictionary];
    
    self.attributedPlaceholder = attrString;
}

@end
