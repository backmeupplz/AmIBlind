//
//  NKLetterLabel.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKSnellenLetterLabel.h"

@implementation NKSnellenLetterLabel

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Change font to Sneller text font
        self.font = [UIFont fontWithName:@"Snellen" size:(self.font.pointSize*0.72)];
    }
    return self;
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
    
    // Set new letter
    self.text = alphabet[random];
}

@end
