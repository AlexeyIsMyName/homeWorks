//
//  Businessman.m
//  homework10(Notification)
//
//  Created by Алексей on 25/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"

@interface Businessman ()

@property (strong, nonatomic) NSMutableArray *averagePriceHistory;
@property (strong, nonatomic) NSMutableArray *inflationHistory;
@property (strong, nonatomic) NSMutableArray *indexClearProfitHistory;

@end

@implementation Businessman

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.averagePriceHistory = [[NSMutableArray alloc] init];
        self.inflationHistory = [[NSMutableArray alloc] init];
        self.indexClearProfitHistory = [[NSMutableArray alloc] init];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(taxLevelChangedNotification:)
                   name:GovernmentTaxLevelDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:GovernmentAveragePriceDidChangeNotification
                 object:nil];
        
    }
    return self;
}

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

-(void) taxLevelChangedNotification: (NSNotification*) notification {
    
    NSNumber *value = [notification.userInfo objectForKey:GovernmentTaxLevelUserInfoKey];
    
    CGFloat taxLevel = [value floatValue];
    
    if (taxLevel < self.taxLevel) {
        NSLog(@"Businessmans are not happy");
    } else {
        NSLog(@"Businessmans are happy");
    }
    
    self.taxLevel = taxLevel;
}

-(void) averagePriceChangedNotification: (NSNotification*) notification {
    
    NSNumber *valueAveragePrice = [notification.userInfo objectForKey:GovernmentAveragePriceUserInfoKey];
    CGFloat averagePrice = [valueAveragePrice floatValue];
    
    if ([self.averagePriceHistory count] > 0) {
        NSUInteger indexLastValueAveragePriceHistory = [self.averagePriceHistory count] - 1;
        CGFloat lastAveragePrice = [[self.averagePriceHistory objectAtIndex: indexLastValueAveragePriceHistory] floatValue];
        
        NSInteger currentInflation = averagePrice / lastAveragePrice * 100 - 100;
        
        CGFloat indexClearProfit = averagePrice / 100 * self.taxLevel;
        NSLog(@"%f", indexClearProfit);
        
        [self.inflationHistory addObject:[NSNumber numberWithInteger:currentInflation]];
        [self.indexClearProfitHistory addObject:[NSNumber numberWithInteger:indexClearProfit]];
    }
    [self.averagePriceHistory addObject:[NSNumber numberWithFloat:averagePrice]];
    
    [self tellMeAboutQualityOfLife];
}

- (void) tellMeAboutQualityOfLife {
    if ([self.inflationHistory count] > 1 && [self.indexClearProfitHistory count] > 1) {
        
        NSInteger indexLastValueInflationHistory = [self.inflationHistory count] - 1;
        NSInteger currentValueInflation = [[self.inflationHistory objectAtIndex: indexLastValueInflationHistory] integerValue];
        NSInteger lastValueInflation = [[self.inflationHistory objectAtIndex: indexLastValueInflationHistory - 1] integerValue];
        //indexClearProfit
        NSInteger indexLastValueIndexClearProfitHistory = [self.indexClearProfitHistory count] - 1;
        NSInteger currentValueIndexClearProfit = [[self.indexClearProfitHistory objectAtIndex: indexLastValueIndexClearProfitHistory] integerValue];
        NSInteger lastValueIndexClearProfit = [[self.indexClearProfitHistory objectAtIndex: indexLastValueIndexClearProfitHistory - 1] integerValue];
        
        if (currentValueInflation < lastValueInflation && currentValueIndexClearProfit < lastValueIndexClearProfit) {
            NSLog(@"Businessman tells what inflation is less and clear profit is better than there was early, it is good!");
        } else {
            NSLog(@"Businessman tells what inflation is more and clear profit is less than there was early, it is terrible!");
        }
    }
}

@end
