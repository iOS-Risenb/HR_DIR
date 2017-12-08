
#import "NSString+HR_Sandbox.h"

@implementation NSString (HR_Sandbox)

+ (NSString *)HR_Sandbox_home {
    return NSHomeDirectory();
}

+ (NSString *)HR_Sandbox_document {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

+ (NSString *)HR_Sandbox_library {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

+ (NSString *)HR_Sandbox_libPreference {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths firstObject] stringByAppendingFormat:@"/Preference"];
}

+ (NSString *)HR_Sandbox_libCache {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths firstObject] stringByAppendingFormat:@"/Caches"];
}

+ (NSString *)HR_Sandbox_tmp {
    return [NSHomeDirectory() stringByAppendingFormat:@"/tmp"];
}


@end
