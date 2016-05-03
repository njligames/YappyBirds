//
//  GameViewController.m
//  IOS
//
//  Created by James Folk on 2/7/16.
//  Copyright © 2016 NJLIGames Ltd. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
{
}
@property (strong, nonatomic) EAGLContext *context;
@property (strong, nonatomic) TZKeyboardPop* customKeyboard;

- (void)setupGL;
- (void)tearDownGL;
@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
#if defined(DEBUG) || defined (_DEBUG)
//    [self emptySandbox];
    
#endif
    
//    setupFileSystem();
    
    [[AVAudioSession sharedInstance] setDelegate:self];
    
    self.customKeyboard = [[TZKeyboardPop alloc] initWithView:self.view];
    self.customKeyboard.delegate = self;
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];

    self.preferredFramesPerSecond = 60;
    
    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    view.drawableStencilFormat = GLKViewDrawableStencilFormat8;
    view.drawableMultisample = GLKViewDrawableMultisample4X;
    view.contentScaleFactor = [UIScreen mainScreen].scale;
    
    [self.view setMultipleTouchEnabled:YES];
    
    UI_USER_INTERFACE_IDIOM();
    
    [self setupGL];
}

- (void)dealloc
{    
    [self tearDownGL];
    
    if ([EAGLContext currentContext] == self.context) {
        [EAGLContext setCurrentContext:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    if ([self isViewLoaded] && ([[self view] window] == nil)) {
        self.view = nil;
        
        [self tearDownGL];
        
        if ([EAGLContext currentContext] == self.context) {
            [EAGLContext setCurrentContext:nil];
        }
        self.context = nil;
    }

    // Dispose of any resources that can be recreated.
    njli::NJLIGameEngine::receivedMemoryWarning();
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)setupGL
{
    [EAGLContext setCurrentContext:self.context];
    
    GLKView* view = (GLKView*)self.view;
    njli::NJLIGameEngine::create(0, 0,
                                 view.frame.size.width * view.contentScaleFactor,
                                 view.frame.size.height * view.contentScaleFactor,
                                 [[UIApplication sharedApplication] statusBarOrientation],
                                 [[UIDeviceUtil hardwareDescription] UTF8String]);
}

- (void)tearDownGL
{
    [EAGLContext setCurrentContext:self.context];
    
    njli::NJLIGameEngine::destroy();
}

#pragma mark - GLKView and GLKViewController delegate methods

- (void)update
{
    njli::NJLIGameEngine::update(self.timeSinceLastUpdate);
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    njli::NJLIGameEngine::render();
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    GLKView* view = (GLKView*)self.view;
    
    njli::NJLIGameEngine::resize(0, 0,
                                 view.frame.size.width * view.contentScaleFactor,
                                 view.frame.size.height * view.contentScaleFactor,
                                 [[UIApplication sharedApplication] statusBarOrientation]);
}

#pragma mark - Touching user input methods

- (void)createTouchVector:(NSSet*)touches
{
    njli::NJLIGameEngine::clearNodeTouches();
    
    int i = 0;
    for (UITouch* touch in touches)
    {
        njli::NJLIGameEngine::setTouch((__bridge const void*)touch, i, touches.count);
        ++i;
    }
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    [self createTouchVector:touches];
    njli::NJLIGameEngine::touchDown();
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
    [self createTouchVector:touches];
    njli::NJLIGameEngine::touchMove();
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
    [self createTouchVector:touches];
    njli::NJLIGameEngine::touchUp();
    
    njli::NJLIGameEngine::clearNodeTouches();
}

- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event
{
    [self createTouchVector:touches];
    njli::NJLIGameEngine::touchCancelled();
}

#pragma mark - Keyboard methods

- (void)showKeyboard:(NSString*)initialText
{
    [self.customKeyboard setTextFieldText:initialText];
    [self.customKeyboard showKeyboard];
}

- (void)didShowKeyboard
{
    njli::NJLIGameEngine::keyboardShow();
}

- (void)didCancelKeyboard
{
    njli::NJLIGameEngine::keyboardCancel();
}

- (void)didReturnKeyPressedWithText:(NSString*)str
{
    njli::NJLIGameEngine::keyboardReturn([str UTF8String]);
}

#pragma mark - Audio methods

- (void)beginInterruption
{
    njli::NJLIGameEngine::pauseSound();
    njli::NJLIGameEngine::pauseGame();
}

- (void)endInterruption
{
    njli::NJLIGameEngine::unpauseSound();
}

/**
 *  @author James Folk, 16-02-15 20:02:20
 *
 *  @brief <#Description#>
 */


-(void)emptySandbox
{
    NSFileManager *fileMgr = [[NSFileManager alloc] init];
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSArray *files = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:nil];
    
    while (files.count > 0) {
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSArray *directoryContents = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error];
        if (error == nil) {
            for (NSString *path in directoryContents) {
                NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:path];
                BOOL removeSuccess = [fileMgr removeItemAtPath:fullPath error:&error];
                files = [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:nil];
                if (!removeSuccess) {
                    // Error
                }
            }
        } else {
            // Error
        }
    }
}

@end
