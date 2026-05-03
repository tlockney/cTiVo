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
@property (nonatomic, readonly) NSArray<MTFormat *> *formatList;
@property (nonatomic, readonly) MTFormat *selectedFormat;
@property (nonatomic) BOOL processingPaused;
- (id)handlePauseProcessingCommand:(NSScriptCommand *)command;
- (id)handleResumeProcessingCommand:(NSScriptCommand *)command;
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

- (NSArray<MTFormat *> *)formatList {
    return tiVoManager.formatList;
}

- (MTFormat *)selectedFormat {
    return tiVoManager.selectedFormat;
}

- (BOOL)processingPaused {
    return tiVoManager.processingPaused.boolValue;
}

- (void)setProcessingPaused:(BOOL)paused {
    tiVoManager.processingPaused = @(paused);
}

- (id)handlePauseProcessingCommand:(NSScriptCommand *)command {
    self.processingPaused = YES;
    return nil;
}

- (id)handleResumeProcessingCommand:(NSScriptCommand *)command {
    self.processingPaused = NO;
    return nil;
}

@end
