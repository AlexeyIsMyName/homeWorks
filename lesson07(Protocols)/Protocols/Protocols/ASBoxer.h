//
//  ASBoxer.h
//  Protocols
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "ASPatient.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASBoxer : NSObject <ASPatient>

@property (assign, nonatomic) CGFloat experiance;
@property (strong, nonatomic) NSString* name;

- (void) work;


@end

NS_ASSUME_NONNULL_END
