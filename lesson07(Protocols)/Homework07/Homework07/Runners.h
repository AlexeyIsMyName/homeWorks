//
//  Runners.h
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Runners <NSObject>


@required

@property (strong, nonatomic) NSString* maxSpeedOfRun;

- (void) run;


@optional

- (NSString*) testOptionalVoid;


@end

NS_ASSUME_NONNULL_END
