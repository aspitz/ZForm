//
//  ZSimpleFormViewController.m
//
//  Created by Ayal Spitz on 8/27/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSimpleFormViewController.h"
#import "ZSimpleTextFieldCell.h"
#import "ZSimpleFormModel.h"

@interface ZSimpleFormViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end


@implementation ZSimpleFormViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.view.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.tableView = [[UITableView alloc]init];
        self.tableView.dataSource = self;
        [self.tableView registerClass:[ZSimpleTextFieldCell class] forCellReuseIdentifier:@"SIMPLE_TEXT_FIELD_CELL"];
        self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:self.tableView];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeTop
                                                             multiplier:1.0
                                                               constant:0.0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1.0
                                                               constant:0.0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                              attribute:NSLayoutAttributeLeft
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeLeft
                                                             multiplier:1.0
                                                               constant:0.0]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.tableView
                                                              attribute:NSLayoutAttributeRight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeRight
                                                             multiplier:1.0
                                                               constant:0.0]];
    }
    return self;
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{ return 1; }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *kCellIdentifier =  @"SIMPLE_TEXT_FIELD_CELL";
    
    ZSimpleTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    [cell setFromDictionary:self.model[indexPath.row]];
    
    cell.textField.delegate = self;
    if (self.showRequiredFlags){
        cell.showRequiredFlag = [self.model isUnfulfilledRequiredElementAtIndex:indexPath.row];
    }

    return cell;
}

#pragma mark - UITextFieldDelegate Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSMutableString *newString = [NSMutableString stringWithString:textField.text];
    [newString replaceCharactersInRange:range withString:string];
    
    ZSimpleTextFieldCell *cell = (ZSimpleTextFieldCell *)[[[textField superview]superview]superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [self.model setValue:newString forIndex:indexPath.row];

    cell.showRequiredFlag = [self.model isUnfulfilledRequiredElementAtIndex:indexPath.row];
    [cell setNeedsDisplay];
    
    return YES;
}

#pragma mark - 

- (BOOL)hasUnfulfilledRequiredElements{
    return [self.model hasUnfulfilledRequiredElements];
}

- (void)flagUnfulfilledRequiredElements{
    self.showRequiredFlags = YES;
    NSIndexSet *unfulfilledRequiredInedxSet = [self.model unfulfilledRequiredElements];
    
    if (unfulfilledRequiredInedxSet.count != 0){
        NSMutableArray *unfulfilledRequiredIndexPaths = [NSMutableArray array];
        [unfulfilledRequiredInedxSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
            [unfulfilledRequiredIndexPaths addObject:[NSIndexPath indexPathForRow:idx inSection:0]];
        }];
        
        [self.tableView reloadRowsAtIndexPaths:unfulfilledRequiredIndexPaths withRowAnimation:NO];
    }
}

- (NSArray *)unfulfilledRequiredCellIndexPaths{
    NSIndexSet *unfulfilledRequiredInedxSet = [self.model unfulfilledRequiredElements];
    NSMutableArray *cellIndexPaths = nil;
    
    if (unfulfilledRequiredInedxSet.count != 0){
        cellIndexPaths = [NSMutableArray array];
        [unfulfilledRequiredInedxSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
            [cellIndexPaths addObject:[NSIndexPath indexPathForRow:idx inSection:0]];
        }];
    }
    
    return cellIndexPaths;
}

- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (NSArray *)allValues{
    return [self.model allValues];
}

@end
