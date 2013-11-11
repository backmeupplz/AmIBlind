//
//  NKCheckViewController.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKCheckViewController.h"

@implementation NKCheckViewController {
    float originalHeight;
}

#pragma mark - View Controller life cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    originalHeight = self.snellenTable.frame.size.height;
}

#pragma mark - Buttons methods -

- (IBAction)sizeSliderChanged:(UISlider *)sender {
    float value = sender.value;
    
    CGPoint center = self.snellenTable.center;
    CGRect frame = self.snellenTable.frame;
    frame.size.height = originalHeight * value;
    self.snellenTable.frame = frame;
    self.snellenTable.center = center;
}

- (IBAction)randomizeTouched:(UIButton *)sender {
    [self.snellenTable randomize];
}

@end
