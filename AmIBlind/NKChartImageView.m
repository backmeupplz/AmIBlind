//
//  NKEChartImageView.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKChartImageView.h"

@implementation NKChartImageView {
    UIView *line;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Randomize for the first time
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

/**
 *  Method to scale view and it's contents
 *
 *  @param scaling Scaling value
 */
- (void)setScaling:(float)scaling {
    self.transform = CGAffineTransformMakeScale(scaling, scaling);
}

/**
 *  Method to add light blue border
 */
- (void)addBorder {
    // Add border
    self.layer.borderColor = [UIColor colorWithRed:0.0f green:0.34f blue:0.62f alpha:1.0f].CGColor;
    self.layer.borderWidth = 1.0;
}

/**
 *  Method to remove border
 */
- (void)removeBorder {
    // Remove border
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.borderWidth = 0.0;
}

@end
