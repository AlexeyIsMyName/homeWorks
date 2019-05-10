//
//  NewStudent.m
//  homework13(Multithreading)
//
//  Created by Алексей on 10/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "NewStudent.h"
#import "UIKit/UIKit.h"

@interface NewStudent ()

+ (NSOperationQueue *) studentQueue;

@end


@implementation NewStudent

- (instancetype)initWithName: (NSString *) name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (void) guessAnswer:(NSInteger) number range:(NSRange) range {
    [[NewStudent studentQueue] addOperationWithBlock:^{
        double startTime = CACurrentMediaTime();
        NSInteger answer = 0;
        NSInteger tryCount = 0;
        
        do {
            answer = arc4random() % range.length;
            tryCount += 1;
        } while (answer != number);
        
        double totalTime = CACurrentMediaTime() - startTime;
        NSLog(@"You number is %ld, %@ guessed your number with %ld tries and %f seconds", answer, self.name, tryCount, totalTime);
    }];
}

- (void) guessAnswer:(NSInteger) number range:(NSRange) range andResultBlock:(void(^)(NSInteger, NSString *, NSInteger, double)) resultBlock {
    [[NewStudent studentQueue] addOperationWithBlock:^{
        double startTime = CACurrentMediaTime();
        NSInteger answer = 0;
        NSInteger tryCount = 0;
        
        do {
            answer = arc4random() % range.length;
            tryCount += 1;
        } while (answer != number);
        
        double totalTime = CACurrentMediaTime() - startTime;
        resultBlock(number, self.name, tryCount, totalTime);
    }];
}

+ (NSOperationQueue *) studentQueue {
    static NSOperationQueue *queue;
    static dispatch_once_t task;
    dispatch_once(&task, ^{
        queue = [[NSOperationQueue alloc] init];
    });
    return queue;
}

@end
