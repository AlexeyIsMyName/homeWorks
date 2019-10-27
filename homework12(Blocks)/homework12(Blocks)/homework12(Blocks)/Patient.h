//
//  Patient.h
//  homework12(Blocks)
//
//  Created by Алексей on 04/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    OrganHead,
    OrganThroat,
    OrganHeart,
    OrganStomach,
} Organ;

@interface Patient : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *sName;
@property (assign, nonatomic) Organ organ;
@property (assign, nonatomic) BOOL isFeelingGood;

- (instancetype)initWithName:(NSString *) name sName:(NSString *) sName;
- (instancetype)initWithBlock:(void(^)(Patient *patient)) block name:(NSString *) name sName:(NSString *) sName;

- (void) takePill;
- (void) makeShot;
- (void) eatHealthyFood;
- (void) takeThroatDrops;

- (void) feelingIll:(void (^)(Patient *)) block;

@end

NS_ASSUME_NONNULL_END
