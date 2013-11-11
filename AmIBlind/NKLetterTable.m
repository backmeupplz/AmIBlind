//
//  NKLetterTable.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKLetterTable.h"
#import "NKLetterLabel.h"

@implementation NKLetterTable

/**
 *  Method to randomize all subview letters
 */
- (void)randomize {
    for (NKLetterLabel *letter in self.subviews) {
        [letter randomize];
    }
}

@end
