//
//  Jumper.h
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Human.h"
#import "Jumpers.h"

NS_ASSUME_NONNULL_BEGIN

@interface Jumper : Human <Jumpers>

@property (strong, nonatomic) NSString* maxHeightOfJump;

@end

NS_ASSUME_NONNULL_END
