//
//  MTDownload+MTScripting.m
//  cTiVo
//
//  AppleScript bridge for MTDownload and the queue (backed by
//  MTTiVoManager): provides object specifiers so scripts can address
//  the queue itself and downloads by position within it.
//

#import <AppKit/AppKit.h>
#import "MTDownload.h"
#import "MTTiVoManager.h"

@interface MTTiVoManager (MTScripting)
@end

@implementation MTTiVoManager (MTScripting)

- (NSScriptObjectSpecifier *)objectSpecifier {
    NSScriptClassDescription *appDesc = (NSScriptClassDescription *)
        [NSScriptClassDescription classDescriptionForClass:[NSApplication class]];
    return [[NSPropertySpecifier alloc] initWithContainerClassDescription:appDesc
                                                       containerSpecifier:nil
                                                                      key:@"downloadQueueObject"];
}

@end

@interface MTDownload (MTScripting)
@end

@implementation MTDownload (MTScripting)

- (NSScriptObjectSpecifier *)objectSpecifier {
    NSUInteger idx = [tiVoManager.downloadQueue indexOfObject:self];
    if (idx == NSNotFound) return nil;
    NSScriptClassDescription *appDesc = (NSScriptClassDescription *)
        [NSScriptClassDescription classDescriptionForClass:[NSApplication class]];
    NSScriptClassDescription *queueDesc = (NSScriptClassDescription *)
        [NSScriptClassDescription classDescriptionForClass:[MTTiVoManager class]];
    NSPropertySpecifier *queueSpec = [[NSPropertySpecifier alloc] initWithContainerClassDescription:appDesc
                                                                                 containerSpecifier:nil
                                                                                                key:@"downloadQueueObject"];
    return [[NSIndexSpecifier alloc] initWithContainerClassDescription:queueDesc
                                                   containerSpecifier:queueSpec
                                                                  key:@"downloadQueue"
                                                                index:(NSInteger)idx];
}

@end
