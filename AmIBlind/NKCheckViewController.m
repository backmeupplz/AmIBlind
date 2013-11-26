//
//  NKCheckViewController.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKCheckViewController.h"
#import "NKSnellenLetterLabel.h"
#import <Social/Social.h>
#import "GAI.h"
#import "GAIDictionaryBuilder.h"

#define animationDuration 0.5

@implementation NKCheckViewController {
    NKTestTable *visibleTable;
    
    NSString *left;
    NSString *right;
    
    BOOL testingInProgress;
}

#pragma mark - View Controller life cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Show Snellen table first
    [self showTable:self.snellenTable];
    
    // Hide testing view initially
    [self hideTestingView:YES animated:NO];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // GA property
    self.screenName = @"Main Screen";
}

#pragma mark - Buttons methods -

- (IBAction)snellenTouched:(UIButton *)sender {
    [self showTable:self.snellenTable];
}

- (IBAction)eChartTouched:(UIButton *)sender {
    [self showTable:self.eChartTable];
}

- (IBAction)cChartTouched:(UIButton *)sender {
    [self showTable:self.cChartTable];
}

- (IBAction)sivtsevTouched:(UIButton *)sender {
    [self showTable:self.sivtsevTable];
}

- (IBAction)snellenTapped:(UITapGestureRecognizer *)sender {
    if (testingInProgress) {
        CGPoint location = [sender locationInView:sender.view];
        float y = location.y;
        NSString *result;
        if (y > 680)
            result = @"20/20";
        else if (y > 610)
            result = @"20/25";
        else if (y > 540)
            result = @"20/30";
        else if (y > 500)
            result = @"20/40";
        else if (y > 440)
            result = @"20/50";
        else if (y > 350)
            result = @"20/70";
        else if (y > 230)
            result = @"20/100";
        else
            result = @"20/200";
        
        if (left == nil) {
            left = result;
            self.closeEyeLabel.text = NSLocalizedString(@"Close your left eye", nil);
        } else {
            right = result;
            [self finishTest];
        }
    }
}

- (IBAction)cChartTapped:(UITapGestureRecognizer *)sender {
    if (testingInProgress) {
        CGPoint location = [sender locationInView:sender.view];
        float y = location.y;
        NSString *result;
        if (y > 775)
            result = @"1,0";
        else if (y > 730)
            result = @"0,9";
        else if (y > 660)
            result = @"0,8";
        else if (y > 600)
            result = @"0,7";
        else if (y > 550)
            result = @"0,6";
        else if (y > 470)
            result = @"0,5";
        else if (y > 420)
            result = @"0,4";
        else if (y > 350)
            result = @"0,3";
        else if (y > 210)
            result = @"0,2";
        else
            result = @"0,1";
        
        if (left == nil) {
            left = result;
            self.closeEyeLabel.text =  NSLocalizedString(@"Close your left eye",nil);
        } else {
            right = result;
            [self finishTest];
        }
    }
}

- (IBAction)sivtsevTapped:(UITapGestureRecognizer *)sender {
    if (testingInProgress) {
        CGPoint location = [sender locationInView:sender.view];
        float y = location.y;
        NSString *result;
        if (y > 775)
            result = @"1,0";
        else if (y > 730)
            result = @"0,9";
        else if (y > 660)
            result = @"0,8";
        else if (y > 600)
            result = @"0,7";
        else if (y > 550)
            result = @"0,6";
        else if (y > 470)
            result = @"0,5";
        else if (y > 420)
            result = @"0,4";
        else if (y > 350)
            result = @"0,3";
        else if (y > 210)
            result = @"0,2";
        else
            result = @"0,1";
        
        if (left == nil) {
            left = result;
            self.closeEyeLabel.text =  NSLocalizedString(@"Close your left eye",nil);
        } else {
            right = result;
            [self finishTest];
        }
    }
}

- (IBAction)eChartTapped:(UITapGestureRecognizer *)sender {
    if (testingInProgress) {
        CGPoint location = [sender locationInView:sender.view];
        float y = location.y;
        NSString *result;
        if (y > 680)
            result = @"20/20";
        else if (y > 610)
            result = @"20/25";
        else if (y > 540)
            result = @"20/30";
        else if (y > 500)
            result = @"20/40";
        else if (y > 440)
            result = @"20/50";
        else if (y > 350)
            result = @"20/70";
        else if (y > 230)
            result = @"20/100";
        else
            result = @"20/200";
        
        if (left == nil) {
            left = result;
            self.closeEyeLabel.text =  NSLocalizedString(@"Close your left eye",nil);
        } else {
            right = result;
            [self finishTest];
        }
    }
}

- (IBAction)randomizeTouched:(UIButton *)sender {
    [visibleTable randomize];
}

- (IBAction)takeTestTouched:(UIButton *)sender {
    // Hide controlls
    [self hideBottomAndUpperViews:YES];
    
    // Show testing view
    [self hideTestingView:NO animated:YES];
    
    // We want to start from clean scene
    // Show all necessary views
    self.closeEyeLabel.hidden = NO;
    self.choseLetterLabel.hidden = NO;
    self.cancellButton.hidden = NO;
    
    // Hide everything else
    self.yourScoreLabel.hidden = YES;
    self.twitterButton.hidden = YES;
    self.facebookButton.hidden = YES;
    self.alrightyThenButton.hidden = YES;
    
    // Fill the right text
    self.closeEyeLabel.text = NSLocalizedString(@"Close your right eye",nil);
    
    testingInProgress = YES;
    left = nil;
    right = nil;
    
    // GA
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"
                                                          action:@"button_press"
                                                           label:@"take_test"
                                                           value:nil] build]];
}

- (IBAction)cancel:(id)sender {
    [self hideBottomAndUpperViews:NO];
    [self hideTestingView:YES animated:YES];
    testingInProgress = NO;
    left = nil;
    right = nil;
}

- (IBAction)twitterButtonTouched:(UIButton *)sender {
    SLComposeViewController *twi = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    [twi setInitialText:[NSString stringWithFormat:NSLocalizedString(@"My eye test result is: %@ (left), %@ (right)! Check your eyes with awesome app AmIBlind! (It's free)",nil),left,right]];
    [twi addURL:[NSURL URLWithString:@"http://itunes.apple.com/us/app/id742545967"]];
    
    [self presentViewController:twi animated:YES completion:nil];
    
    // GA
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"
                                                          action:@"button_press"
                                                           label:@"twitter"
                                                           value:nil] build]];
}

- (IBAction)facebookButtonTouched:(UIButton *)sender {
    SLComposeViewController *fb = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [fb setInitialText:[NSString stringWithFormat:NSLocalizedString(@"My eye test result is: %@ (left), %@ (right)! Check your eyes with awesome app AmIBlind! (It's free)",nil),left,right]];
    [fb addURL:[NSURL URLWithString:@"http://itunes.apple.com/us/app/id742545967"]];
    fb.completionHandler = ^(SLComposeViewControllerResult result) {
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    
    [self presentViewController:fb animated:YES completion:nil];
    
    // GA
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"
                                                          action:@"button_press"
                                                           label:@"facebook"
                                                           value:nil] build]];
}

- (IBAction)allrightyThenButtonTouched:(UIButton *)sender {
    [self hideTestingView:YES animated:YES];
    [self hideBottomAndUpperViews:NO];
    
    testingInProgress = NO;
    left = nil;
    right = nil;
}

#pragma mark - General methods -

/**
 *  Method to show table. Hides others
 *
 *  @param table Table to show
 */
- (void)showTable:(NKTestTable *)table {
    // Show required table, hide others
    self.snellenTable.hidden = !(table == self.snellenTable);
    self.eChartTable.hidden = !(table == self.eChartTable);
    self.cChartTable.hidden = !(table == self.cChartTable);
    self.sivtsevTable.hidden = !(table == self.sivtsevTable);
    
    // Save reference to table
    visibleTable = table;
}

/**
 *  Method to hide or show bottom and upper views. Also moves visible table
 *
 *  @param hide YES - hide, NO - show
 */
- (void)hideBottomAndUpperViews:(BOOL)hide {
    // Perform operations
    [UIView animateWithDuration:animationDuration animations:^{
        // Move bottom view
        float offset = (hide) ? self.bottomView.frame.size.height : -self.bottomView.frame.size.height;
        self.bottomView.frame = CGRectOffset(self.bottomView.frame, 0, offset);
        
        // Move visible table
        visibleTable.frame = CGRectOffset(visibleTable.frame, 0, offset);
    }];
}

/**
 *  Method to show or hide testing view (on the top)
 *
 *  @param hide     YES - hide, NO - show
 *  @param animated YES - animated, NO - not animated
 */
- (void)hideTestingView:(BOOL)hide animated:(BOOL)animated {
    if (animated) {
        // Perform Animations
        [UIView animateWithDuration:animationDuration animations:^{
            // Move testing view
            float offset = (hide) ? -self.testingView.frame.size.height : self.testingView.frame.size.height;
            self.testingView.frame = CGRectOffset(self.testingView.frame, 0, offset);
        }];
    } else {
        // Move testing view
        float offset = (hide) ? -self.testingView.frame.size.height : self.testingView.frame.size.height;
        self.testingView.frame = CGRectOffset(self.testingView.frame, 0, offset);
    }
}

- (void)finishTest {
    testingInProgress = NO;
    
    // Set right score label
    self.yourScoreLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Your score is: %@ (left), %@ (right)",nil),left,right];
    
    // Show necessary views
    self.yourScoreLabel.hidden = NO;
    self.twitterButton.hidden = NO;
    self.facebookButton.hidden = NO;
    self.alrightyThenButton.hidden = NO;
    
    // Hide cancel button
    self.cancellButton.hidden = YES;
    self.closeEyeLabel.hidden = YES;
    self.choseLetterLabel.hidden = YES;
}

#pragma mark - Status bar -

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
