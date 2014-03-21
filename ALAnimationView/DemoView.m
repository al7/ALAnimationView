//
//  DemoView.m
//  ALAnimationView
//
//  Created by Alexandre Leite on 3/20/14.
//  Copyright (c) 2014 al7dev. All rights reserved.
//

#import "DemoView.h"

@implementation DemoView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.demoAnimatioView = [[ALAnimationView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 60.0)
                                                       animationImages:[ALAnimationView animationImagesArrayWithName:@"Gears" numberOfFrames:9 numberOfZeroes:4] //<-- convenience method to populate images array;
                                                     animationDuration:0.8
                                                               repeats:YES];
        [self addSubview:self.demoAnimatioView];
        
        self.outputLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 30.0)];
        self.outputLabel.textAlignment = NSTextAlignmentCenter;
        self.outputLabel.backgroundColor = [UIColor clearColor];
        self.outputLabel.textColor = [UIColor blackColor];
        self.outputLabel.text = @"Press play to start animation";
        [self addSubview:self.outputLabel];
        
        self.playPauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.playPauseButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
        self.playPauseButton.titleLabel.textColor = [UIColor whiteColor];
        [self.playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
        [self addSubview:self.playPauseButton];
        
        self.rewindButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rewindButton.backgroundColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
        self.rewindButton.titleLabel.textColor = [UIColor whiteColor];
        self.rewindButton.alpha = 0.5;
        self.rewindButton.enabled = NO;
        [self.rewindButton setTitle:@"Rewind" forState:UIControlStateNormal];
        [self addSubview:self.rewindButton];
    }
    return self;
}

#pragma mark - Base Overrides;

-(void)layoutSubviews {
    CGRect demoAnimationViewFrame = self.demoAnimatioView.frame;
    demoAnimationViewFrame.origin.y = 30.0;
    demoAnimationViewFrame.origin.x = (self.bounds.size.width / 2.0) - (demoAnimationViewFrame.size.width / 2.0);
    self.demoAnimatioView.frame = demoAnimationViewFrame;
    
    CGRect outputLabelFrame = self.outputLabel.frame;
    outputLabelFrame.origin.x = (self.bounds.size.width / 2.0) - (outputLabelFrame.size.width / 2.0);
    outputLabelFrame.origin.y = demoAnimationViewFrame.origin.y + demoAnimationViewFrame.size.height + 5.0;
    self.outputLabel.frame = outputLabelFrame;
    
    CGRect playPauseButtonFrame = self.playPauseButton.frame;
    playPauseButtonFrame.size.width = 300.0;
    playPauseButtonFrame.size.height = 40.0;
    playPauseButtonFrame.origin.x = (self.bounds.size.width / 2.0) - (playPauseButtonFrame.size.width / 2.0);
    playPauseButtonFrame.origin.y = outputLabelFrame.origin.y + outputLabelFrame.size.height + 5.0;
    self.playPauseButton.frame = playPauseButtonFrame;
    
    CGRect rewindButtonFrame = self.rewindButton.frame;
    rewindButtonFrame.size.width = 300.0;
    rewindButtonFrame.size.height = 40.0;
    rewindButtonFrame.origin.x = (self.bounds.size.width / 2.0) - (rewindButtonFrame.size.width / 2.0);
    rewindButtonFrame.origin.y = playPauseButtonFrame.origin.y + playPauseButtonFrame.size.height + 5.0;
    self.rewindButton.frame = rewindButtonFrame;
}

@end
