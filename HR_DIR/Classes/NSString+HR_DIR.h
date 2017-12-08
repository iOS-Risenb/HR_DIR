

#import <Foundation/Foundation.h>

@interface NSString (HR_DIR)

#pragma mrak A
/** new dir */
- (BOOL)HR_DIRNew;

#pragma mrak D
/** delete dir */
- (BOOL)HR_DIRDelete;

#pragma mrak M

#pragma mrak Q
/** contents of dir */
- (NSArray *)HR_DIROfContents;
/** check dir */
- (BOOL)HR_IsDir;
/** sub dirs */
- (NSArray <NSString *>*)HR_SubDirsRecursive:(BOOL)recursive absolute:(BOOL)absolute;

@end
