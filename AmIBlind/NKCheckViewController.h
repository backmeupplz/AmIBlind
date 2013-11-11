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

@property (weak, nonatomic) IBOutlet UIView *bottomView;

- (IBAction)snellenTouched:(UIButton *)sender;
- (IBAction)eChartTouched:(UIButton *)sender;
- (IBAction)cChartTouched:(UIButton *)sender;
- (IBAction)sivtsevTouched:(UIButton *)sender;

- (IBAction)sizeSliderChanged:(UISlider *)sender;
- (IBAction)randomizeTouched:(UIButton *)sender;

@end
