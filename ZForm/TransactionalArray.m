//
//  TransactionalArray.m
//  DateCell
//
//  Created by Ayal Spitz on 7/11/13.
//
//

#import "TransactionalArray.h"

typedef NS_ENUM(NSInteger, TransactionType) {
    kInsertTransactionType,
    kRemoveTransactionType
};

@interface TransactionTupple : NSObject

@property (assign) TransactionType type;
@property (assign) NSInteger index;
@property (strong) id object;

- (instancetype)initWithType:(TransactionType)type atIndex:(NSUInteger)index withObject:(id)object;
+ (instancetype)transactionTuppleOfType:(TransactionType)type atIndex:(NSUInteger)index withObject:(id)object;

@end

@implementation TransactionTupple

- (id)initWithType:(TransactionType)type atIndex:(NSUInteger)index withObject:(id)object{
    self = [super init];
    if (self) {
        self.type = type;
        self.index = index;
        self.object = object;
    }
    return self;
}

+ (instancetype)transactionTuppleOfType:(TransactionType)type atIndex:(NSUInteger)index withObject:(id)object{
    return [[[self class]alloc]initWithType:type atIndex:index withObject:object];
}

@end



@interface TransactionalArray()

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *transactions;
@property (nonatomic, assign) BOOL inTransaction;
@property (nonatomic, strong) NSRecursiveLock *transactionLock;

@end

@implementation TransactionalArray

- (id)init{
    self = [super init];
    if (self) {
        self.transactions = [NSMutableArray array];
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)beginTransaction{
    [self.transactionLock lock];
    [self.transactions removeAllObjects];
    self.inTransaction = YES;
}

- (void)endTransaction{
    for (NSUInteger i=0;i<self.transactions.count;i++){
        TransactionTupple *transaction = self.transactions[i];
        
        switch (transaction.type) {
            case kInsertTransactionType:{
                for (NSUInteger j=i+1;j<self.transactions.count;j++){
                    TransactionTupple *newTransaction = self.transactions[j];
                    if (newTransaction.index >= transaction.index){
                        newTransaction.index++;
                    }
                }
                [self.data insertObject:transaction.object atIndex:transaction.index];
            }break;
                
            case kRemoveTransactionType:{
                for (NSUInteger j=i+1;j<self.transactions.count;j++){
                    TransactionTupple *newTransaction = self.transactions[j];
                    if (newTransaction.index > transaction.index){
                        newTransaction.index--;
                    }
                }
                [self.data removeObjectAtIndex:transaction.index];
            }break;
        }
    }

    self.inTransaction = NO;
    [self.transactionLock unlock];
}

- (void)addObject:(id)anObject{
    [self.transactionLock lock];
    if (self.inTransaction){
        [self.transactions addObject:[TransactionTupple transactionTuppleOfType:kInsertTransactionType atIndex:self.data.count withObject:anObject]];
    } else {
        [self.data addObject:anObject];
    }
    [self.transactionLock unlock];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index{
    [self.transactionLock lock];
    if (self.inTransaction){
        [self.transactions addObject:[TransactionTupple transactionTuppleOfType:kInsertTransactionType atIndex:index withObject:anObject]];
    } else {
        [self.data insertObject:anObject atIndex:index];
    }
    [self.transactionLock unlock];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    [self.transactionLock lock];
    if (self.inTransaction){
        [self.transactions addObject:[TransactionTupple transactionTuppleOfType:kRemoveTransactionType atIndex:index withObject:nil]];
    } else {
        [self.data removeObjectAtIndex:index];
    }
    [self.transactionLock unlock];
}

@end
