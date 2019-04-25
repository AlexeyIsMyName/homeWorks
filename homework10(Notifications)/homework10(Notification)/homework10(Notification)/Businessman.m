//
//  Businessman.m
//  homework10(Notification)
//
//  Created by Алексей on 25/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"

@implementation Businessman

- (instancetype)init
{
    self = [super init];
    if (self) {
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
    
}

@end
