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
    cough,
    runnyNose,
    soreThroat,
    stomachAche,
    headAche,
    temperature,
    none
} Symptom;

typedef enum {
    head,
    stomach,
    leg,
    throat,
    heart,
    tooth,
    nothing
} Organ;

@protocol PatientDelegate;

@interface Patient : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat temperature;
@property (assign, nonatomic) Symptom symptom;

@property (weak, nonatomic) id <PatientDelegate> delegate;

- (void) goToDoctor;

- (instancetype)initWithName:(NSString *)name
                 temperature:(CGFloat)temperature
                     symptom:(Symptom)symptom;

@end

@protocol PatientDelegate

- (void) patientCure:(Patient*) patient;

@end

NS_ASSUME_NONNULL_END
