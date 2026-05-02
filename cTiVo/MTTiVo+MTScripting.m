//
//  MTTiVo+MTScripting.m
//  cTiVo
//
//  AppleScript bridge for MTTiVo: provides the user-facing display name
//  and an object specifier so scripts can address tivos by name.
//

#import <AppKit/AppKit.h>
#import "MTTiVo.h"
#import "MTNetService.h"

@interface MTTiVo (MTScripting)
@property (nonatomic, readonly) NSString *name;
@end

@implementation MTTiVo (MTScripting)

- (NSString *)name {
    return self.tiVo.name ?: @"";
}

- (NSScriptObjectSpecifier *)objectSpecifier {
    NSScriptClassDescription *appDesc = (NSScriptClassDescription *)
        [NSScriptClassDescription classDescriptionForClass:[NSApplication class]];
    return [[NSNameSpecifier alloc] initWithContainerClassDescription:appDesc
                                                   containerSpecifier:nil
                                                                  key:@"tivos"
                                                                 name:self.name];
}

@end
