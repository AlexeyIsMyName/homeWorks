//
//  Jumper.h
//  05.NSArray
//
//  Created by Алексей on 04/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import "Human.h"

NS_ASSUME_NONNULL_BEGIN

@interface Jumper : Human

@property (strong, nonatomic) NSString* nickname;
@property (assign, nonatomic) CGFloat maxLength;

@end

NS_ASSUME_NONNULL_END
