//
//  ViewController.m
//  JH-Demo
//
//  Created by Vincenzo Romano on 15/08/19.
//  Copyright © 2019 AivenLau. All rights reserved.
//

#import "ViewController.h"
#import "JH_WifiCamera.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JH_WifiCamera *wfcamera = [[JH_WifiCamera alloc] init];
    [wfcamera naInit:@""];
}


@end
