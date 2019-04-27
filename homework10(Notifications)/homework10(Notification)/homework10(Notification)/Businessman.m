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
@property (strong, nonatomic) NSMutableArray *consumerAbilityHistory;

@end

@implementation Businessman

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.averagePriceHistory = [[NSMutableArray alloc] init];
        self.inflationHistory = [[NSMutableArray alloc] init];
        self.consumerAbilityHistory = [[NSMutableArray alloc] init];
        
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
        NSInteger currentConcumerAbility = self.taxLevel / averagePrice;
        
        [self.inflationHistory addObject:[NSNumber numberWithInteger:currentInflation]];
        [self.consumerAbilityHistory addObject:[NSNumber numberWithInteger:currentConcumerAbility]];
    }
    [self.averagePriceHistory addObject:[NSNumber numberWithFloat:averagePrice]];
    
    [self tellMeAboutQualityOfLife];
}

- (void) tellMeAboutQualityOfLife {
    if ([self.inflationHistory count] > 1 && [self.consumerAbilityHistory count] > 1) {
        
        NSInteger indexLastValueInflationHistory = [self.inflationHistory count] - 1;
        NSInteger currentValueInflation = [[self.inflationHistory objectAtIndex: indexLastValueInflationHistory] integerValue];
        NSInteger lastValueInflation = [[self.inflationHistory objectAtIndex: indexLastValueInflationHistory - 1] integerValue];
        
        NSInteger indexLastValueConsumerAbilityHistory = [self.consumerAbilityHistory count] - 1;
        NSInteger currentValueConsumerAbility = [[self.consumerAbilityHistory objectAtIndex: indexLastValueConsumerAbilityHistory] integerValue];
        NSInteger lastValueConsumerAbility = [[self.consumerAbilityHistory objectAtIndex: indexLastValueConsumerAbilityHistory - 1] integerValue];
        
        if (currentValueInflation < lastValueInflation && currentValueConsumerAbility > lastValueConsumerAbility) {
            NSLog(@"Businessman think what life is BETTER than was in the past!");
        } else {
            NSLog(@"Businessman think what life is WORSE than was in the past!");
        }
    }
}

@end
