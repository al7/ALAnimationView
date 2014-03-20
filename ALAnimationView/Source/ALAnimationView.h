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

#import <Foundation/Foundation.h>

@class ALAnimationView;

@protocol ALAnimationViewDelegate <NSObject>

@optional
-(void)animationViewBeganPlaying:(ALAnimationView *)animationView;
-(void)animationViewStoppedPlaying:(ALAnimationView *)animationView;
-(void)animationViewRewound:(ALAnimationView *)animationView;
-(void)animationView:(ALAnimationView *)animationView movedToFrame:(NSInteger)frameNumber;

@end

@interface ALAnimationView : UIView

@property (unsafe_unretained, nonatomic) id <ALAnimationViewDelegate> delegate;
@property (assign, nonatomic) CFTimeInterval animationDuration;
@property (strong, nonatomic) NSArray *animationImages;
@property (assign, nonatomic) BOOL repeats;

#pragma mark - Initializers;

-(id)initWithFrame:(CGRect)frame
   animationImages:(NSArray *)animationImages
 animationDuration:(CFTimeInterval)animationDuration
           repeats:(BOOL)repeats;

-(id)initWithFrame:(CGRect)frame
   animationImages:(NSArray *)animationImages
 animationDuration:(CFTimeInterval)animationDuration;

#pragma mark - Public Methods;

-(void)play;
-(void)stop;
-(void)rewind;
-(NSInteger)currentFrame;

#pragma mark - Static Methods;

+(NSArray *)animationImagesArrayWithName:(NSString *)imageName numberOfFrames:(NSInteger)numberOfFrames;

@end
