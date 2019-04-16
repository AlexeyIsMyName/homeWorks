//
//  Human.h
//  05.NSArray
//
//  Created by Алексей on 03/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Human : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* gender;
@property (assign, nonatomic) CGFloat weight;
@property (assign, nonatomic) CGFloat height;



- (void) move;

@end

NS_ASSUME_NONNULL_END
