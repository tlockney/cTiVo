//
//  NSApplication+MTScripting.m
//  cTiVo
//
//  AppleScript bridge: exposes MTTiVoManager's collections as scripting
//  elements of the application object.
//

#import <AppKit/AppKit.h>
#import "MTTiVoManager.h"

@interface NSApplication (MTScripting)
@property (nonatomic, readonly) NSArray<MTTiVo *> *tivos;
@property (nonatomic, readonly) NSArray<MTTiVoShow *> *tivoShows;
@end

@implementation NSApplication (MTScripting)

- (NSArray<MTTiVo *> *)tivos {
    return tiVoManager.tiVoList;
}

- (NSArray<MTTiVoShow *> *)tivoShows {
    return tiVoManager.tiVoShows;
}

@end
