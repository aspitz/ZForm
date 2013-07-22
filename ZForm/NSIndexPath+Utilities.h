//
//  NSIndexPath+Utilities.h
//
//  Created by Ayal Spitz on 7/10/13.
//
//

#import <Foundation/Foundation.h>

@interface NSIndexPath (Utilities)

- (instancetype)indexPathOfRowWithDelta:(NSInteger)delta;

- (BOOL)isEqualToIndexPath:(NSIndexPath *)indexPath;
- (BOOL)isBefore:(NSIndexPath *)indexPath;
- (BOOL)isAfter:(NSIndexPath *)indexPath;

@end
