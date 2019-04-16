//
//  ASPatient.h
//  Protocols
//
//  Created by Алексей on 10/04/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ASPatient <NSObject>


@required

@property (strong, nonatomic) NSString* name;
- (BOOL) areYouOK;
- (void) takePill;
- (void) makeShot;


@optional

- (NSString*) howIsYourFamily;
- (NSString*) howISYouJob;

@end

NS_ASSUME_NONNULL_END
