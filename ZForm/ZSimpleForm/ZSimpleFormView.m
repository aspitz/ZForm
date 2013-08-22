//
//  ZSimpleFormView.m
//  RegisterView
//
//  Created by Ayal Spitz on 8/8/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSimpleFormView.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "ZButton.h"

@interface ZSimpleFormView ()

@property (nonatomic, strong) TPKeyboardAvoidingScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;

@end


@implementation ZSimpleFormView

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
    self.scrollView = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:CGRectZero];
    [self addSubview:self.scrollView];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.layer.cornerRadius = 5.0;
    self.tableView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.tableView.layer.borderWidth = 0.5;
    [self.scrollView addSubview:self.tableView];

    self.rightButton = [[ZButton alloc]initWithTitle:@"" andImage:nil aligned:ZImageAlignmentRight];
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightButton.tintColor = self.tintColor;
    [self.scrollView addSubview:self.rightButton];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.rightButton
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.tableView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.rightButton
                                                                attribute:NSLayoutAttributeRight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.tableView
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1.0
                                                                 constant:0.0]];

    self.leftButton = [[ZButton alloc]initWithTitle:@"" andImage:nil aligned:ZImageAlignmentLeft];
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.leftButton.tintColor = self.tintColor;
    [self.scrollView addSubview:self.leftButton];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.leftButton
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.tableView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:10.0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.leftButton
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.tableView
                                                                attribute:NSLayoutAttributeLeft
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    
    self.contentInset = UIEdgeInsetsMake(40.0, 40.0, 0.0, 40.0);
}

- (void)layoutSubviews{
    CGRect viewBounds = self.bounds;
    
    self.scrollView.frame = viewBounds;
    self.scrollView.contentSize = viewBounds.size;

    NSUInteger numberOfRows = [self.tableView.dataSource tableView:self.tableView numberOfRowsInSection:0];
    CGRect tableViewFrame = CGRectZero;
    tableViewFrame.origin.x = self.contentInset.left;
    tableViewFrame.origin.y = 20.0 + self.contentInset.top;
    tableViewFrame.size.width = viewBounds.size.width - (self.contentInset.left + self.contentInset.right);
    tableViewFrame.size.height = numberOfRows * 44.0;
    self.tableView.frame = tableViewFrame;
}


- (void)setTitle:(NSString *)title andImage:(UIImage *)image ofButton:(ZButton *)button{
    button.title = title;
    button.image = image;
    [self setNeedsLayout];
}

- (void)setLeftButtonTitle:(NSString *)title andImage:(UIImage *)image{
    [self setTitle:title andImage:image ofButton:self.leftButton];
}

- (void)setRightButtonTitle:(NSString *)title andImage:(UIImage *)image{
    [self setTitle:title andImage:image ofButton:self.rightButton];
}

- (void)setDataSource:(id<UITableViewDataSource>)dataSource{
    self.tableView.dataSource = dataSource;
}

@end
