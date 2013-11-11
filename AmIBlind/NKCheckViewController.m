//
//  NKCheckViewController.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKCheckViewController.h"

@implementation NKCheckViewController {
    NKTestTable *visibleTable;
    
    float originalHeight;
}

#pragma mark - View Controller life cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    originalHeight = self.snellenTable.frame.size.height;
    
    // Show Snellen table first
    [self showTable:self.snellenTable];
}

#pragma mark - Buttons methods -

- (IBAction)snellenTouched:(UIButton *)sender {
    [self showTable:self.snellenTable];
}

- (IBAction)eChartTouched:(UIButton *)sender {
    [self showTable:self.eChartTable];
}

- (IBAction)cChartTouched:(UIButton *)sender {
    [self showTable:self.cChartTable];
}

- (IBAction)sivtsevTouched:(UIButton *)sender {
    [self showTable:self.sivtsevTable];
}

- (IBAction)sizeSliderChanged:(UISlider *)sender {
    visibleTable.contentScaling = sender.value;
}

- (IBAction)randomizeTouched:(UIButton *)sender {
    [visibleTable randomize];
}

#pragma mark - General methods -

/**
 *  Method to show table. Hides others
 *
 *  @param table Table to show
 */
- (void)showTable:(NKTestTable *)table {
    // Show required table, hide others
    self.snellenTable.hidden = !(table == self.snellenTable);
    self.eChartTable.hidden = !(table == self.eChartTable);
    self.cChartTable.hidden = !(table == self.cChartTable);
    self.sivtsevTable.hidden = !(table == self.sivtsevTable);
    
    // Save reference to table
    visibleTable = table;
}

#pragma mark - Status bar -

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
