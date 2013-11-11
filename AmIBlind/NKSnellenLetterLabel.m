//
//  NKLetterLabel.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKSnellenLetterLabel.h"

@implementation NKSnellenLetterLabel {
    CGRect originalFrame;
    
    UIView *line;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Change font to user defined
        [self changeFont];
        
        // Save original frame
        originalFrame = self.frame;
    }
    return self;
}

/**
 *  Method to change font to Snellen
 */
- (void)changeFont {
    // Change font to Snellen text font
    self.font = [UIFont fontWithName:@"Snellen" size:(self.font.pointSize*0.72)];
}

/**
 *  Method to randomize letter. ALso flips it around y-axis
 */
- (void)randomize {
    // Flip view
    [UIView transitionWithView:self
                      duration:1.0
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:nil
                    completion:nil];
    // Change letter
    [self changeLetter];
}

/**
 *  Method to change letter to random one
 */
- (void)changeLetter {
    // Get alphabet
    NSArray *alphabet =  @[@"C", @"D", @"E", @"F", @"H", @"K", @"N", @"P", @"R", @"U", @"V", @"Z"];
    
    // Get random number 0...(alphabet.count-1)
    int random = arc4random() % alphabet.count;
    
    // Make sure there will be no repeats
    while ([self.text isEqualToString:alphabet[random]])
        random = arc4random() % alphabet.count;
    
    // Set new letter
    self.text = alphabet[random];
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
