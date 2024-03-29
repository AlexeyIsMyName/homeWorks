//
//  Patient.h
//  homework09(Delegates)
//
//  Created by Алексей on 22/04/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    SymptomCough,
    SymptomRunnyNose,
    SymptomSoreThroat,
    SymptomStomachAche,
    SymptomHeadAche,
    SymptomTemperature,
    SymptomNone
} Symptom;

typedef enum {
    OrganHead,
    OrganStomach,
    OrganLeg,
    OrganThroat,
    OrganHeart,
    OrganTooth,
    OrganNothing
} Organ;

@protocol PatientDelegate;

@interface Patient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic) Symptom symptom;
@property (assign, nonatomic) Organ organ;
@property (assign, nonatomic) NSInteger rateDoc;

@property (weak, nonatomic) id <PatientDelegate> delegate;

- (void) goToDoctor;
- (BOOL) rateTheDoctor;

- (instancetype)initWithName:(NSString *)name
                 temperature:(CGFloat)temperature
                     symptom:(Symptom)symptom
                       organ:(Organ)organ;

@end

@protocol PatientDelegate

- (void) patientCure:(Patient *) patient;

@end

NS_ASSUME_NONNULL_END
