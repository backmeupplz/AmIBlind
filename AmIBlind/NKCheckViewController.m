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
    
    originalHeight = self.sivcevTable.frame.size.height;
}

#pragma mark - Buttons methods -

- (IBAction)sizeSliderChanged:(UISlider *)sender {
    float value = sender.value;
    
    CGPoint center = self.sivcevTable.center;
    CGRect frame = self.sivcevTable.frame;
    frame.size.height = originalHeight * value;
    self.sivcevTable.frame = frame;
    self.sivcevTable.center = center;
}

- (IBAction)randomizeTouched:(UIButton *)sender {
    [self.sivcevTable randomize];
}

@end
