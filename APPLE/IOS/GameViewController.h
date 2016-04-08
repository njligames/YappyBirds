//
//  GameViewController.h
//  IOS
//
//  Created by James Folk on 2/7/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#import <AVFoundation/AVAudioSession.h>
#import <GLKit/GLKit.h>
#import <UIKit/UIKit.h>

#import <NJLIGameEngine_iOS/NJLIGameEngine_iOS.h>
#import <NJLIGameEngine_iOS/TZKeyboardPop.h>
#import <NJLIGameEngine_iOS/UIDeviceUtil.h>

@interface GameViewController : GLKViewController <TZKeyboardPopDelegate, AVAudioSessionDelegate>

- (void)showKeyboard:(NSString*)initialText;

@end