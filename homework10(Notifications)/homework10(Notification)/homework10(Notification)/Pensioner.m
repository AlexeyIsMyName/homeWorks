//
//  Pensioner.m
//  homework10(Notification)
//
//  Created by Алексей on 25/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"

@implementation Pensioner

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(pensionChangedNotification:)
                   name:GovernmentPensionDidChangeNotification
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

-(void) pensionChangedNotification: (NSNotification*) notification {
    
    NSNumber *value = [notification.userInfo objectForKey:GovernmentPensionUserInfoKey];
    
    CGFloat pension = [value floatValue];
    
    if (pension < self.pension) {
        NSLog(@"Pensioners are not happy");
    } else {
        NSLog(@"Pensioners are happy");
    }
    
    self.pension = pension;
    
}

-(void) averagePriceChangedNotification: (NSNotification*) notification {
    
}

@end
