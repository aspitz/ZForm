//
//  NSIndexPath+Utilities.m
//  DateCell
//
//  Created by Ayal Spitz on 7/10/13.
//
//

#import "NSIndexPath+Utilities.h"

@implementation NSIndexPath (Utilities)

- (instancetype)indexPathOfRowWithDelta:(NSInteger)delta{
    return [NSIndexPath indexPathForRow:self.row + delta inSection:self.section];
}


- (BOOL)isEqualToIndexPath:(NSIndexPath *)indexPath{
    return ([self compare:indexPath] == NSOrderedSame);
}

- (BOOL)isBefore:(NSIndexPath *)indexPath{
    return ([self compare:indexPath] == NSOrderedAscending);
}

- (BOOL)isAfter:(NSIndexPath *)indexPath{
    return ([self compare:indexPath] == NSOrderedDescending);
}

@end
