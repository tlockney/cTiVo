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
@property (nonatomic, readonly) MTTiVoManager *downloadQueueObject;
@property (nonatomic, readonly) NSArray<MTDownload *> *downloadQueue;
@end

@implementation NSApplication (MTScripting)

- (NSArray<MTTiVo *> *)tivos {
    return tiVoManager.tiVoList;
}

- (NSArray<MTTiVoShow *> *)tivoShows {
    return tiVoManager.tiVoShows;
}

- (MTTiVoManager *)downloadQueueObject {
    return tiVoManager;
}

- (NSArray<MTDownload *> *)downloadQueue {
    return tiVoManager.downloadQueue;
}

@end
