//
//  ZCheckbox.m
//  ZForm
//
//  Created by Ayal Spitz on 7/21/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZCheckbox.h"
#import "ZCheckmarkImages.h"

@interface ZCheckbox ()
@property (nonatomic, strong) UIImage *checkedImage;
@property (nonatomic, strong) UIImage *uncheckedImage;
@end


@implementation ZCheckbox

- (instancetype)initWithCheckedImageName:(NSString *)checkedImageName andUncheckedImageName:(NSString *)uncheckedImageName{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.checkedImage = [ZCheckmarkImages checkmark];
        self.uncheckedImage = [ZCheckmarkImages uncheckedmark];
        self.checked = NO;
        
        CGSize imageSize = self.checkedImage.size;
        CGRect checkboxFrame = self.frame;
        checkboxFrame.size = imageSize;
        self.frame = checkboxFrame;
        
        [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

+ (instancetype)checkbox{
    return [[[self class]alloc]initWithCheckedImageName:@"checkmark2.png" andUncheckedImageName:@"uncheckmark2.png"];
}

- (IBAction)buttonPressed:(id)sender{
    [self toggleCheckbox];
}

- (void)toggleCheckbox{
    self.checked = !self.checked;
}

- (void)setChecked:(BOOL)checked{
    _checked = checked;
    UIImage *image = checked ? self.checkedImage : self.uncheckedImage;
    [self setImage:image forState:UIControlStateNormal];
}

@end
