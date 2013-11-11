//
//  NKEChartImageView.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKEChartImageView.h"

@implementation NKEChartImageView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self randomizeWithoutAnimation];
    }
    return self;
}

- (void)randomize {
    // Animate rotation
    [UIView animateWithDuration:0.5 animations:^{
        [self randomizeWithoutAnimation];
    }];
}

/**
 *  Method to randomize direction of E without animation
 */
- (void)randomizeWithoutAnimation {
    // Get random number 0...3
    int random = arc4random() % 4;
    
    // Make rotation
    self.transform = CGAffineTransformMakeRotation(M_PI_2*random);
}

@end
