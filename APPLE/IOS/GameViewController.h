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

#import <NJLIGameEngine/NJLIGameEngine.h>
#import <NJLIGameEngine/TZKeyboardPop.h>
#import <NJLIGameEngine/UIDeviceUtil.h>

@interface GameViewController : GLKViewController <TZKeyboardPopDelegate, AVAudioSessionDelegate>

- (void)showKeyboard:(NSString*)initialText;

@end