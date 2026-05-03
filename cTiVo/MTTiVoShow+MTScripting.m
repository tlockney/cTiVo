//
//  MTTiVoShow+MTScripting.m
//  cTiVo
//
//  AppleScript bridge for MTTiVoShow: provides an object specifier so
//  scripts can address shows by id under their parent tivo.
//

#import <AppKit/AppKit.h>
#import "MTTiVoShow.h"
#import "MTTiVo.h"

@interface MTTiVoShow (MTScripting)
@end

@implementation MTTiVoShow (MTScripting)

- (NSScriptObjectSpecifier *)objectSpecifier {
    NSScriptObjectSpecifier *tivoSpec = [self.tiVo objectSpecifier];
    if (!tivoSpec) return nil;
    NSScriptClassDescription *tivoDesc = (NSScriptClassDescription *)
        [NSScriptClassDescription classDescriptionForClass:[MTTiVo class]];
    return [[NSUniqueIDSpecifier alloc] initWithContainerClassDescription:tivoDesc
                                                       containerSpecifier:tivoSpec
                                                                      key:@"shows"
                                                                 uniqueID:@(self.showID)];
}

@end
