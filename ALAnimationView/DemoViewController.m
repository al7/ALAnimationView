//
//  DemoViewController.m
//  ALAnimationView
//
//  Created by Alexandre Leite on 3/20/14.
//  Copyright (c) 2014 al7dev. All rights reserved.
//

#import "DemoViewController.h"

@implementation DemoViewController

#pragma mark - View lifecycle;

-(void)loadView {
    self.demoView = [DemoView new];
    self.view = self.demoView;
}

-(void)viewDidLoad {
    self.demoView.demoAnimatioView.delegate = self;
    [self.demoView.playPauseButton addTarget:self action:@selector(onPlayPauseTouch:) forControlEvents:UIControlEventTouchUpInside];
    [self.demoView.rewindButton addTarget:self action:@selector(onRewindTouch:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Action Targets;

-(void)onPlayPauseTouch:(id)sender {
    if (![self.demoView.demoAnimatioView isPlaying]) {
        [self.demoView.demoAnimatioView play];
        [self.demoView.playPauseButton setTitle:@"Stop" forState:UIControlStateNormal];
        self.demoView.rewindButton.enabled = NO;
        self.demoView.rewindButton.alpha = 0.5;
        
    }
    else {
        [self.demoView.demoAnimatioView stop];
        [self.demoView.playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
        self.demoView.rewindButton.enabled = YES;
        self.demoView.rewindButton.alpha = 1.0;
    }
}

-(void)onRewindTouch:(id)sender {
    [self.demoView.demoAnimatioView rewind];
}

#pragma mark - Animation View Delegate;

-(void)animationView:(ALAnimationView *)animationView didGoToFrame:(NSInteger)frameNumber {
    NSString *outputText = [NSString stringWithFormat:@"Animation did go to frame: %i", frameNumber];
    self.demoView.outputLabel.text = outputText;
}

-(void)animationViewDidStartPlaying:(ALAnimationView *)animationView {
    NSString *outputText = [NSString stringWithFormat:@"Animation did start playing - frame: %i", animationView.currentFrame];
    self.demoView.outputLabel.text = outputText;
}

-(void)animationViewDidRewind:(ALAnimationView *)animationView {
    self.demoView.outputLabel.text = @"Animation was rewound";
}

-(void)animationViewDidStopPlaying:(ALAnimationView *)animationView {
    NSString *outputText = [NSString stringWithFormat:@"Animation did stop playing - frame: %i", animationView.currentFrame];
    self.demoView.outputLabel.text = outputText;
}

@end
