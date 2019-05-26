//
//  ViewController.h
//  homework20(Outlets)
//
//  Created by Алексей on 26/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *mainField;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *cells;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *figures;

@end

