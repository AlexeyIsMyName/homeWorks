//
//  ASBoxer.m
//  Protocols
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "ASBoxer.h"

@implementation ASBoxer


- (void) work {
    
}


#pragma mark - ASPatient

- (BOOL) areYouOK {
    
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is Boxer %@ ok? %@", self.name, ok ? @"YES" : @"NO");
    
    return ok;
}

- (void) takePill {
    NSLog(@"Boxer %@ takes a pill", self.name);
}

- (void) makeShot {
    NSLog(@"Boxer %@ makes a shot", self.name);
}

- (NSString*) howISYouJob {
    return @"My Job is awesome!";
}


@end
