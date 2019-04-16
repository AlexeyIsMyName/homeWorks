//
//  Kangaroo.h
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Animal.h"
#import "Jumpers.h"

NS_ASSUME_NONNULL_BEGIN

@interface Kangaroo : Animal <Jumpers>

@property (strong, nonatomic) NSString* maxHeightOfJump;

@end

NS_ASSUME_NONNULL_END
