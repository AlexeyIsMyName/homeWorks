//
//  Flyers.h
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Flyers <NSObject>


@required

@property (strong, nonatomic) NSString* maxDistanceOfFly;

- (void) fly;


@optional

- (NSString*) testOptionalVoid;


@end

NS_ASSUME_NONNULL_END
