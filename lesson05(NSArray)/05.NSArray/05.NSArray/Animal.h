//
//  Animal.h
//  05.NSArray
//
//  Created by Алексей on 04/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animal : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger legs;

- (void) move;

@end

NS_ASSUME_NONNULL_END
