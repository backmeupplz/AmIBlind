//
//  NKSivtsevLetterLabel.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 11.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKSivtsevLetterLabel.h"

@implementation NKSivtsevLetterLabel

/**
 *  Method to change letter to random one
 */
- (void)changeLetter {
    // Get alphabet
    NSArray *alphabet =  @[@"Ш", @"Б", @"М", @"Н", @"К", @"Ы", @"И"];
    
    // Get random number 0...(alphabet.count-1)
    int random = arc4random() % alphabet.count;
    
    // Make sure there will be no repeats
    while ([self.text isEqualToString:alphabet[random]])
        random = arc4random() % alphabet.count;
    
    // Set new letter
    self.text = alphabet[random];
}

/**
 *  Method to change font to Snellen
 */
- (void)changeFont {
    // Just don't change font
}

@end
