//
//  Human.h
//  Homework07
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Human : NSObject


@property (strong, nonatomic) NSString* name;

- (void) tellMeAboutSelf;


@end

NS_ASSUME_NONNULL_END
