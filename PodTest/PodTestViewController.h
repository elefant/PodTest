//
//  PodTestViewController.h
//  PodTest
//
//  Created by bird on 12/3/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PodTestViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *timeLabel;

@property (retain, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)onStartClicked:(UIButton*)sender;

- (IBAction)onStopClicked:(id)sender;

- (IBAction)OnStartTouchDown:(id)sender;

- (IBAction)onStartTouchCancel:(id)sender;


@end
