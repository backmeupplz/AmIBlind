//
//  NKCheckViewController.h
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKTestTable.h"

@interface NKCheckViewController : UIViewController

// UI Properties
@property (weak, nonatomic) IBOutlet NKTestTable *snellenTable;
@property (weak, nonatomic) IBOutlet NKTestTable *eChartTable;
@property (weak, nonatomic) IBOutlet NKTestTable *cChartTable;
@property (weak, nonatomic) IBOutlet NKTestTable *sivtsevTable;

@property (weak, nonatomic) IBOutlet UIView *testingView;
@property (weak, nonatomic) IBOutlet UIView *upperView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UILabel *closeEyeLabel;
@property (weak, nonatomic) IBOutlet UILabel *choseLetterLabel;

@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;

@property (weak, nonatomic) IBOutlet UIButton *cancellButton;

@property (weak, nonatomic) IBOutlet UILabel *yourScoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UIButton *alrightyThenButton;


- (IBAction)snellenTouched:(UIButton *)sender;
- (IBAction)eChartTouched:(UIButton *)sender;
- (IBAction)cChartTouched:(UIButton *)sender;
- (IBAction)sivtsevTouched:(UIButton *)sender;

- (IBAction)sizeSliderChanged:(UISlider *)sender;
- (IBAction)randomizeTouched:(UIButton *)sender;
- (IBAction)takeTestTouched:(UIButton *)sender;
- (IBAction)cancel:(id)sender;

- (IBAction)answerTouched:(UIButton *)sender;

- (IBAction)twitterButtonTouched:(UIButton *)sender;
- (IBAction)facebookButtonTouched:(UIButton *)sender;
- (IBAction)allrightyThenButtonTouched:(UIButton *)sender;

@end
