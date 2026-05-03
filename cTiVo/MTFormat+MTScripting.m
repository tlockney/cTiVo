//
//  MTFormat+MTScripting.m
//  cTiVo
//
//  AppleScript bridge for MTFormat: provides an object specifier so
//  scripts can address formats by name.
//

#import <AppKit/AppKit.h>
#import "MTFormat.h"

@interface MTFormat (MTScripting)
@end

@implementation MTFormat (MTScripting)

- (NSScriptObjectSpecifier *)objectSpecifier {
    if (self.name.length == 0) return nil;
    NSScriptClassDescription *appDesc = (NSScriptClassDescription *)
        [NSScriptClassDescription classDescriptionForClass:[NSApplication class]];
    return [[NSNameSpecifier alloc] initWithContainerClassDescription:appDesc
                                                   containerSpecifier:nil
                                                                  key:@"formatList"
                                                                 name:self.name];
}

@end
