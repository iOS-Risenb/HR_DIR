

#import "NSString+HR_DIR.h"

@implementation NSString (HR_DIR)

#pragma mrak A
/** new dir */
- (BOOL)HR_DIRNew {
    if ([self HR_IsDir]) {
        return NO;
    }
    [[NSFileManager defaultManager] createDirectoryAtPath:self withIntermediateDirectories:YES attributes:nil error:nil];
    if (![self HR_IsDir]) {
        return NO;
    }
    return YES;
}

#pragma mrak D
/** delete dir */
- (BOOL)HR_DIRDelete {
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:self error:&error];
    return !error;
}

#pragma mrak M

#pragma mrak Q
/** contents of dir */
- (NSArray *)HR_DIROfContents {
    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self error:nil];
}
/** check dir */
- (BOOL)HR_IsDir {
    BOOL isDir;
    [[NSFileManager defaultManager] fileExistsAtPath:self isDirectory:&isDir];
    return isDir;
}
/** sub dirs */
- (NSArray <NSString *>*)HR_SubDirsRecursive:(BOOL)recursive absolute:(BOOL)absolute {
    NSMutableArray *marr = [NSMutableArray array];
    NSArray *subArray = [[NSFileManager defaultManager] subpathsAtPath:self];
    [subArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BOOL isDir = [[self stringByAppendingPathComponent:obj] HR_IsDir];
        if (isDir) {
            if (recursive) {
                NSString *dir = obj;
                if (absolute) {
                    dir = [self stringByAppendingPathComponent:dir];
                }
                [marr addObject:dir];
            } else {
                BOOL isRecursiveDir = [obj componentsSeparatedByString:@"/"].count > 1;
                if (!isRecursiveDir) {
                    NSString *dir = obj;
                    if (absolute) {
                        dir = [self stringByAppendingPathComponent:dir];
                    }
                    [marr addObject:dir];
                }
            }
        }
    }];
    return marr;
}

@end
