//
//  DemoViewController.h
//  ALAnimationView
//
//  Created by Alexandre Leite on 3/20/14.
//  Copyright (c) 2014 al7dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoView.h"

@interface DemoViewController : UIViewController <ALAnimationViewDelegate>

@property (strong, nonatomic) DemoView *demoView;

@end
