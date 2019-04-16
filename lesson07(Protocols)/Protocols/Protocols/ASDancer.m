//
//  ASDancer.m
//  Protocols
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "ASDancer.h"

@implementation ASDancer


- (void) dance {
    
}


#pragma mark - ASPatient

- (BOOL) areYouOK {
    
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is Dancer %@ ok? %@", self.name, ok ? @"YES" : @"NO");
    
    return ok;
}

- (void) takePill {
    NSLog(@"Dancer %@ takes a pill", self.name);
}

- (void) makeShot {
    NSLog(@"Dancer %@ makes a shot", self.name);
}



@end
