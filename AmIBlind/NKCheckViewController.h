//
//  NKCheckViewController.h
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKLetterTable.h"

@interface NKCheckViewController : UIViewController

// UI Properties
@property (weak, nonatomic) IBOutlet NKLetterTable *snellenTable;

- (IBAction)sizeSliderChanged:(UISlider *)sender;
- (IBAction)randomizeTouched:(UIButton *)sender;

@end
