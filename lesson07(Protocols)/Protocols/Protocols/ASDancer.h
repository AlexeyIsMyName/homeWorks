//
//  ASDancer.h
//  Protocols
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASPatient.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASDancer : NSObject <ASPatient>


@property (strong, nonatomic) NSString* favouriteDance;
@property (strong, nonatomic) NSString* name;

- (void) dance;




@end

NS_ASSUME_NONNULL_END
