//
//  NKLetterTable.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKTestTable.h"
#import "NKRandomizableObject.h"

@implementation NKTestTable

/**
 *  Method to randomize all subview letters
 */
- (void)randomize {
    // Loop over all subviews
    for (id<NKRandomizableObject> view in self.subviews)
        // If can be randomized, randomize
        if ([view conformsToProtocol:@protocol(NKRandomizableObject)])
            [view randomize];
}

@end
