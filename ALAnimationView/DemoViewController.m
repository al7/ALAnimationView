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

@end
