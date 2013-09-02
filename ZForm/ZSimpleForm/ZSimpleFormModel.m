//
//  ZSimpleFormModel.m
//
//  Created by Ayal Spitz on 8/8/13.
//  Copyright (c) 2013 Ayal Spitz. All rights reserved.
//

#import "ZSimpleFormModel.h"
#import "ZSimpleTextFieldCell.h"

@interface ZSimpleFormModel ()

@property (nonatomic, strong) NSMutableArray *array;

@end


@implementation ZSimpleFormModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
        self.defaultTextAlignment = NSTextAlignmentLeft;
    }
    return self;
}

+ (instancetype)model{
    return [[[self class]alloc]init];
}

#pragma mark - Build Model methods

- (void)add:(NSDictionary *)elementDictionary{
    [self.array addObject:[elementDictionary mutableCopy]];
}

#pragma mark -

- (NSUInteger)count{
    return self.array.count;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx{
    NSMutableDictionary *elementDictionary = self.array[idx];
    if (elementDictionary[TEXT_ALIGNMENT_KEY] == nil){
        elementDictionary[TEXT_ALIGNMENT_KEY] = @(self.defaultTextAlignment);
    }
    
    return elementDictionary;
}

- (void)setValue:(NSString *)value forIndex:(NSUInteger)idx{
    NSMutableDictionary *dictionary = self.array[idx];
    dictionary[VALUE_KEY] = value;
}

- (NSArray *)allValues{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.array.count];
    [self.array enumerateObjectsUsingBlock:^(NSDictionary *elementDictionary, NSUInteger idx, BOOL *stop) {
        NSString *value = elementDictionary[VALUE_KEY];
        if (value.length == 0){
            value = @"";
        }
        [array addObject:value];
    }];
    
    return array;
}

#pragma mark - Unfulfilled required element methods

- (BOOL)isUnfulfilledRequiredElement:(NSDictionary *)dictionary{
    BOOL isRequired = [dictionary[REQUIRED_KEY] boolValue];
    NSString *value = dictionary[VALUE_KEY];
    
    return isRequired && (value.length == 0);
}

- (BOOL)hasUnfulfilledRequiredElements{
    __block BOOL flag = NO;
    [self.array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger idx, BOOL *stop) {
        flag = [self isUnfulfilledRequiredElement:dictionary];
        *stop = flag;
    }];

    return flag;
}

- (BOOL)isUnfulfilledRequiredElementAtIndex:(NSUInteger)idx{
    return [self isUnfulfilledRequiredElement:self.array[idx]];
}

- (NSIndexSet *)unfulfilledRequiredElements{
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    
    [self.array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger idx, BOOL *stop) {
        if ([self isUnfulfilledRequiredElement:dictionary]){
            [indexSet addIndex:idx];
        }
    }];
    
    return indexSet;
}

@end
