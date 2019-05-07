//
//  Student.m
//  homework13(Multithreading)
//
//  Created by Алексей on 07/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "Student.h"
#import "UIKit/UIKit.h"

@implementation Student

- (instancetype)initWithName: (NSString *) name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (void) guessAnswer:(NSInteger) number range:(NSRange) range {
    
    dispatch_async([Student studentQueue], ^{
        double startTime = CACurrentMediaTime();
        NSInteger answer = 0;
        NSInteger tryCount = 0;
        
        do {
            answer = arc4random() % range.length;
            tryCount += 1;
        } while (answer != number);
        
        double totalTime = CACurrentMediaTime() - startTime;
        NSLog(@"You number is %ld, %@ guessed your number with %ld tries and %f seconds", answer, self.name, tryCount, totalTime);
    });
}

+ (dispatch_queue_t) studentQueue {
    static dispatch_queue_t queue;
    static dispatch_once_t task;
    dispatch_once(&task, ^{
        queue = dispatch_queue_create("com.suslov.testthreads.queue", DISPATCH_QUEUE_CONCURRENT);
    });
    return queue;
}

@end
