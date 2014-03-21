//
//  DemoView.h
//  ALAnimationView
//
//  Created by Alexandre Leite on 3/20/14.
//  Copyright (c) 2014 al7dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALAnimationView.h"

@interface DemoView : UIView

@property (strong, nonatomic) ALAnimationView *demoAnimatioView;
@property (strong, nonatomic) UIButton *playPauseButton;
@property (strong, nonatomic) UIButton *rewindButton;
@property (strong, nonatomic) UILabel *outputLabel;

@end
