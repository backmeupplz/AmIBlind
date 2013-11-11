//
//  NKLetterTable.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKLetterTable.h"
#import "NKSnellenLetterLabel.h"

@implementation NKLetterTable

/**
 *  Method to randomize all subview letters
 */
- (void)randomize {
    for (NKSnellenLetterLabel *letter in self.subviews) {
        if ([letter class] == [NKSnellenLetterLabel class])
            [letter randomize];
    }
}

@end
