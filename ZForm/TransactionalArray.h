//
//  TransactionalArray.h
//  DateCell
//
//  Created by Ayal Spitz on 7/11/13.
//
//

#import <Foundation/Foundation.h>

@interface TransactionalArray : NSObject

- (void)beginTransaction;
- (void)endTransaction;

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)addObject:(id)anObject;

@end
