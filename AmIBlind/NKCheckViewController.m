//
//  NKCheckViewController.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKCheckViewController.h"
#import "NKSnellenLetterLabel.h"

#define animationDuration 0.5

@implementation NKCheckViewController {
    NKTestTable *visibleTable;
    
    float originalHeight;
}

#pragma mark - View Controller life cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    originalHeight = self.snellenTable.frame.size.height;
    
    // Show Snellen table first
    [self showTable:self.snellenTable];
    
    // Hide testing view initially
    [self hideTestingView:YES animated:NO];
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

- (IBAction)sizeSliderChanged:(UISlider *)sender {
    visibleTable.contentScaling = sender.value;
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
    self.buttonOne.hidden = NO;
    self.buttonTwo.hidden = NO;
    self.buttonThree.hidden = NO;
    self.cancellButton.hidden = NO;
    
    // Hide everything else
    self.yourScoreLabel.hidden = YES;
    self.twitterButton.hidden = YES;
    self.facebookButton.hidden = YES;
    self.alrightyThenButton.hidden = YES;
    
    // Fill the right text
    self.closeEyeLabel.text = @"Close your right eye";
    if ([visibleTable.subviews[3] isKindOfClass:[NKSnellenLetterLabel class]])
        self.choseLetterLabel.text = @"Choose the letter marked below:";
    else
        self.choseLetterLabel.text = @"Choose the symbol marked below:";
}

- (IBAction)cancel:(id)sender {
    [self hideBottomAndUpperViews:NO];
    [self hideTestingView:YES animated:YES];
}

- (IBAction)answerTouched:(UIButton *)sender {
    [self finishTestWithLeftEye:@"1.0" andRightEye:@"1.0"];
}

- (IBAction)twitterButtonTouched:(UIButton *)sender {
    [self hideTestingView:YES animated:YES];
    [self hideBottomAndUpperViews:NO];
}

- (IBAction)facebookButtonTouched:(UIButton *)sender {
    [self hideTestingView:YES animated:YES];
    [self hideBottomAndUpperViews:NO];
}

- (IBAction)allrightyThenButtonTouched:(UIButton *)sender {
    [self hideTestingView:YES animated:YES];
    [self hideBottomAndUpperViews:NO];
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

- (void)finishTestWithLeftEye:(NSString *)leftResult andRightEye:(NSString *)rightResult {
    // Set right score label
    self.yourScoreLabel.text = [NSString stringWithFormat:@"Your score is: %@ (left), %@ (right)",leftResult,rightResult];
    
    // Show necessary views
    self.yourScoreLabel.hidden = NO;
    self.twitterButton.hidden = NO;
    self.facebookButton.hidden = NO;
    self.alrightyThenButton.hidden = NO;
    
    // Hide cancel button
    self.cancellButton.hidden = YES;
    self.closeEyeLabel.hidden = YES;
    self.choseLetterLabel.hidden = YES;
    self.buttonOne.hidden = YES;
    self.buttonTwo.hidden = YES;
    self.buttonThree.hidden = YES;
}

#pragma mark - Status bar -

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
