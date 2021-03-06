//
//  al7ios framework
//  (C) Copyright 2010-14 Alexandre Leite. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this
// software and associated documentation files (the "Software"), to deal in the Software
// without restriction, including without limitation the rights to use, copy, modify, merge,
// publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
// to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
// BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "ALAnimationView.h"

@interface ALAnimationView () {
    NSInteger _currentFrame;
    NSInteger _totalFrames;
    UIImageView *animationImageView;
    BOOL shouldStopAnimation;
}

@property (strong, nonatomic) NSTimer *animationTimer;

#pragma mark - Helper Methods;

-(void)goToNextFrame;
-(void)goToPreviousFrame;

#pragma mark - Action Targets;

-(void)onTimerTick:(id)sender;

@end

@implementation ALAnimationView

@synthesize delegate = _delegate;
@synthesize animationTimer = _animationTimer;
@synthesize animationImages = _animationImages;
@synthesize animationDuration = _animationDuration;
@synthesize repeats = _repeats;

#pragma mark - Initializers;

-(id)initWithFrame:(CGRect)frame
   animationImages:(NSArray *)animationImages
 animationDuration:(CFTimeInterval)animationDuration
           repeats:(BOOL)repeats {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setAnimationDuration:animationDuration];
        [self setAnimationImages:animationImages];
        [self setRepeats:repeats];
        
        _currentFrame = 0;
        _totalFrames = [[self animationImages] count];
        animationImageView = [[UIImageView alloc] initWithFrame:[self bounds]];
        [self addSubview:animationImageView];
        [self rewind];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
   animationImages:(NSArray *)animationImages
 animationDuration:(CFTimeInterval)animationDuration {
    return [self initWithFrame:frame
               animationImages:animationImages
             animationDuration:animationDuration
                       repeats:YES];
}

#pragma mark - Base Overrides;

-(void)layoutSubviews {
    animationImageView.frame = self.bounds;
}

#pragma mark - Public Methods;

-(void)play {
    if (![self animationTimer] && _totalFrames > 0) {
        if ([self delegate]) {
            if ([[self delegate] respondsToSelector:@selector(animationViewDidStartPlaying:)]) {
                [[self delegate] animationViewDidStartPlaying:self];
            }
        }
        
        shouldStopAnimation = NO;
        NSTimeInterval timerDelay = [self animationDuration] / [[self animationImages] count];
        [self setAnimationTimer:[NSTimer scheduledTimerWithTimeInterval:timerDelay
                                                                 target:self
                                                               selector:@selector(onTimerTick:)
                                                               userInfo:nil
                                                                repeats:YES]];
    }
}

-(void)stop {
    if ([self animationTimer]) {
        [[self animationTimer] invalidate];
        [self setAnimationTimer:nil];
        
        if ([self delegate]) {
            if ([[self delegate] respondsToSelector:@selector(animationViewDidStopPlaying:)]) {
                [[self delegate] animationViewDidStopPlaying:self];
            }
        }
    }
}

-(void)rewind {
    [self stop];
    _currentFrame = 0;
    
    if (_totalFrames > 0) {
        [animationImageView setImage:[[self animationImages] objectAtIndex:0]];
        if ([self delegate]) {
            if ([[self delegate] respondsToSelector:@selector(animationViewDidRewind:)]) {
                [[self delegate] animationViewDidRewind:self];
            }
        }
    }
}

-(NSInteger)currentFrame {
    return _currentFrame;
}

-(BOOL)isPlaying {
    return (self.animationTimer != nil);
}

#pragma mark - Action Targets;

-(void)onTimerTick:(id)sender {
    [self goToNextFrame];
}

#pragma mark - Helper Methods;

-(void)goToNextFrame {
    NSInteger nextFrame = _currentFrame + 1;
    if (nextFrame >= _totalFrames) {
        nextFrame = 0;
        if (![self repeats]) {
            shouldStopAnimation = YES;
        }
    }

    if (!shouldStopAnimation) {
        [animationImageView setImage:[[self animationImages] objectAtIndex:nextFrame]];
        [animationImageView setNeedsDisplay];
        _currentFrame = nextFrame;
        if ([self delegate]) {
            if ([[self delegate] respondsToSelector:@selector(animationView:didGoToFrame:)]) {
                [[self delegate] animationView:self didGoToFrame:nextFrame];
            }
        }
    }
    else {
        [self stop];
    }
}

-(void)goToPreviousFrame {
    
}

#pragma mark - Static Methods;

+(NSArray *)animationImagesArrayWithName:(NSString *)imageName
                          numberOfFrames:(NSInteger)numberOfFrames
                          numberOfZeroes:(NSInteger)numberOfZeroes{
    
    NSMutableArray *result = [NSMutableArray array];
    for (NSInteger imageI = 1; imageI <= numberOfFrames; imageI++) {
        NSString *numberString = [NSString stringWithFormat:@"%li", (long)imageI];
        NSInteger zeroesToAppend = numberOfZeroes - numberString.length;
        NSString *zeroString = @"";
        for (NSInteger zeroI = 0; zeroI < zeroesToAppend; zeroI++) {
            zeroString = [NSString stringWithFormat:@"%@0", zeroString];
        }
        
        NSString *processedImageName = [NSString stringWithFormat:@"%@%@%@", imageName, zeroString, numberString];
        UIImage *animationImage = [UIImage imageNamed:processedImageName];
        
        if (animationImage) {
            [result addObject:animationImage];
        }
        else {
            NSLog(@"ALAnimationView: ERROR: Couldn't find image: %@", processedImageName);
        }
    }
    return [NSArray arrayWithArray:result];
}

+(NSArray *)animationImagesArrayWithName:(NSString *)imageName numberOfFrames:(NSInteger)numberOfFrames {
    return [ALAnimationView animationImagesArrayWithName:imageName numberOfFrames:numberOfFrames numberOfZeroes:3];
}

@end