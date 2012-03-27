//
//  PodTestViewController.m
//  PodTest
//
//  Created by bird on 12/3/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PodTestViewController.h"

#define TIMER_TICK_PERIOD ( 0.01 )

#define TIMER_COUNTDOWN_PERIOD ( 1 )

#define COUNTDOWN_AMOUNT ( 3 )

@interface PodTestViewController()

@property int ellapseTicks;

@property int countdownRemain;

@property BOOL isCountingdown;

@property (retain, nonatomic) NSTimer* timer;

@property (retain, nonatomic) NSTimer* countdownTimer;

- (void)onTimerFired:(NSTimer*)aTimer;

- (void)onCountdownTimerFired:(NSTimer*)aTimer;

- (void)updateTimeLabel;

- (void)finishCountdown;

@end

@implementation PodTestViewController

@synthesize timeLabel;

@synthesize startButton;

@synthesize countdownRemain;

@synthesize ellapseTicks;

@synthesize timer;

@synthesize countdownTimer;

@synthesize isCountingdown;

- (void)dealloc 
{
    [timeLabel release];
    [startButton release];
    [super dealloc];
}

- (void)viewDidUnload 
{
    [self setTimeLabel:nil];
    [self setStartButton:nil];
    [super viewDidUnload];
}

- (IBAction)onStartClicked:(UIButton*)sender 
{
    /*
    self.timer = [NSTimer scheduledTimerWithTimeInterval:TIMER_TICK_PERIOD
                                                  target:self
                                                selector:@selector(onTimerFired:)
                                                userInfo:nil
                                                 repeats:YES];
    */
}

- (IBAction)onStopClicked:(id)sender 
{
    [self.timer invalidate];
    self.timer = nil;
    self.ellapseTicks = 0;
    [self updateTimeLabel];
}

- (IBAction)OnStartTouchDown:(id)sender 
{
    NSLog( @"touch down" );
    
    
    if( NO == self.isCountingdown )
    {
        self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:TIMER_COUNTDOWN_PERIOD
                                                               target:self
                                                            selector:@selector(onCountdownTimerFired:)
                                                             userInfo:nil
                                                              repeats:YES];
    
        self.countdownRemain = COUNTDOWN_AMOUNT;
        
        self.isCountingdown = YES;
    }
}

- (IBAction)onStartTouchCancel:(id)sender 
{
    NSLog( @"touch up" );
    
    if( 0 == self.countdownRemain )
    {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:TIMER_TICK_PERIOD
                                                      target:self
                                                    selector:@selector(onTimerFired:)
                                                    userInfo:nil
                                                     repeats:YES];
    }
    else
    {
        [self finishCountdown];
    }
}

- (void)onTimerFired:(NSTimer*)aTimer
{
    self.ellapseTicks++;
    [self updateTimeLabel];
}

- (void)onCountdownTimerFired:(NSTimer*)aTimer
{
    if( self.countdownRemain > 0 )
    {
        self.countdownRemain--;
        self.startButton.titleLabel.text = [NSString stringWithFormat:@"Start ( %d )", self.countdownRemain];
    }
    else
    {
        [self finishCountdown];
    }
}

- (void)updateTimeLabel
{
    double timeEllapseInSecond = self.ellapseTicks * TIMER_TICK_PERIOD;
    self.timeLabel.text = [NSString stringWithFormat:@"%5.2lf", timeEllapseInSecond];
}

- (void)finishCountdown
{
    [self.countdownTimer invalidate];
    self.countdownTimer = nil;
    self.isCountingdown = NO;
    //self.countdownRemain = COUNTDOWN_AMOUNT;
}

@end
