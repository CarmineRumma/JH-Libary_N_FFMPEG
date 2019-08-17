//
//  ViewController.m
//  JH-Demo
//
//  Created by Vincenzo Romano on 15/08/19.
//  Copyright © 2019 AivenLau. All rights reserved.
//

#import "ViewController.h"
#import "JH_WifiCamera.h"

@interface ViewController (){
    JH_WifiCamera *wfcamera;
    JH_OpenGLView *imageView;
    UIImageView *dImageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imageView = [[JH_OpenGLView alloc] initWithFrame:self.view.bounds];
    //dImageView =[[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:imageView];
    //[self.view addSubview:dImageView];
    wfcamera = [[JH_WifiCamera alloc] init];
    [wfcamera setDelegate:self];
    [wfcamera naSetDispView:imageView BackGround:nil];
    [wfcamera naInit:@""];
    [wfcamera naGetFiles:TYPE_SNAP_FILES];
    
    [wfcamera naPlay:@"" ImageView:imageView];
    
    UIButton *getphotoBTN = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    getphotoBTN.frame = CGRectMake(10, 40, 100, 40);
    [getphotoBTN setBackgroundColor:[UIColor whiteColor]];
    [getphotoBTN setTitle:@"SCATTA" forState:UIControlStateNormal];
    [getphotoBTN addTarget:self action:@selector(onSnap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getphotoBTN];
    
}

- (void)StatusChanged:(int)nStatus{
    NSLog(@"StatusChanged: %d", nStatus);
}
- (void)StatusChanged_GP:(int)nStatus{
    NSLog(@"StatusChanged_GP: %d", nStatus);
}
- (void)GetWifiData:(NSData *)data{
    NSLog(@"WIFI DATA: %@", data);
}
- (void)GetFiles:(NSString *)sFilesName{
    NSLog(@"GetFiles:: %@", sFilesName);
}

- (void)GetBatteryLevel:(int)nByte{
    NSLog(@"GetBatteryLevel:: %@", nByte);
}

- (void)GetModelInfo:(NSData *)data{
     NSLog(@"data: %@", data);
}
- (void)SnapPhotoCompelete:(BOOL)bSaveOK{
    NSLog(@"SnapPhotoCompelete: %d", bSaveOK);
}
- (void)onSnap:(id)sender{
    [wfcamera naSnapPhoto:@"TEST" SaveTyoe:TYPE_BOTH_PHONE_SD Destination:TYPE_DEST_GALLERY];
    
    NSLog(@"SNAP OK");
}

- (void)onSnapSandbox:(id)sender{
    [wfcamera naSnapPhoto:@"TEST" SaveTyoe:TYPE_BOTH_PHONE_SD Destination:TYPE_DEST_SNADBOX];
    NSLog(@"SNAP OK");
}



@end
