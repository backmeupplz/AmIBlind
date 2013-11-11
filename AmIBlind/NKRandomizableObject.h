//
//  NKRandomizableObject.h
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NKRandomizableObject <NSObject>

@required
- (void)randomize;

@end
