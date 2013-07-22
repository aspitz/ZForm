//
//  ZCheckbox.h
//  ZForm
//
//  Created by Ayal Spitz on 7/21/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCheckbox : UIButton

@property (nonatomic, assign, getter = isChecked) BOOL checked;

- (instancetype)initWithCheckedImageName:(NSString *)checkedImageName andUncheckedImageName:(NSString *)uncheckedImageName;
+ (instancetype)checkbox;

- (void)toggleCheckbox;
- (void)setChecked:(BOOL)checked;

@end
