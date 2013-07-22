//
//  NSString+Utilities.m
//  DateCell
//
//  Created by Ayal Spitz on 7/16/13.
//
//

#import "NSString+Utilities.h"

@implementation NSString (Utilities)

+ (NSString *)UUID{
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuidStr = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    CFRelease(uuid);
    
    return uuidStr;
}

@end
