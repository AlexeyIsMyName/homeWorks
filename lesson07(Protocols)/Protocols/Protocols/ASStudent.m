//
//  ASStudent.m
//  Protocols
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "ASStudent.h"

@implementation ASStudent

- (void) study {
    
}


#pragma mark - ASPatient

- (BOOL) areYouOK {
    
    BOOL ok = arc4random() % 2;
    
    NSLog(@"Is Student %@ ok? %@", self.name, ok ? @"YES" : @"NO");
    
    return ok;
}

- (void) takePill {
    NSLog(@"Student %@ takes a pill", self.name);
}

- (void) makeShot {
    NSLog(@"Student %@ makes a shot", self.name);
}


- (NSString*) howIsYourFamily {
    return @"My family is doing well!";
}


@end
