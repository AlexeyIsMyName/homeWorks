//
//  ViewController.m
//  homework19(UIViewGeometry)
//
//  Created by Алексей on 22/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) CGPoint middlePoint;
@property (assign, nonatomic) NSInteger sizeCell;

- (CGPoint) makeFirstPoint;
- (CGRect) makeMainRect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     Ученик
     1! В цикле создавайте квадратные UIView с черным фоном и расположите их в виде шахматной доски
     2! доска должна иметь столько клеток, как и настоящая шахматная
    */
    
    CGRect mainRect = [self makeMainRect];
    
    UIView *mainWhiteView = [[UIView alloc] initWithFrame:mainRect];
    mainWhiteView.backgroundColor = [UIColor whiteColor];
    mainWhiteView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    
    [self.view addSubview:mainWhiteView];
    
    NSInteger x = self.sizeCell;
    NSInteger y = 0;
    CGRect cellRect = CGRectZero;
    
    for (int indexY = 0; indexY < 8; indexY++) {
        for (int indexX = 0; indexX < 4; indexX++) {
            cellRect = CGRectMake(x, y, self.sizeCell, self.sizeCell);
            UIView *cellBlackView = [[UIView alloc] initWithFrame:cellRect];
            cellBlackView.backgroundColor = [UIColor blackColor];
            [mainWhiteView addSubview:cellBlackView];
            x = x + (self.sizeCell * 2);
        }
        y = y + self.sizeCell;
        x = (indexY % 2 == 0) ? 0 : self.sizeCell;
    }
}

- (UIInterfaceOrientationMask) supportedInterfaceOrientation {
    return UIInterfaceOrientationMaskAll;
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    //NSLog(@"height = %f, width = %f", self.view.bounds.size.height, self.view.bounds.size.width);
    
}


/*
Студент
3! Доска должна быть вписана в максимально возможный квадрат, т.е. либо бока, либо верх или низ должны касаться границ экрана
4. Применяя соответствующие маски сделайте так, чтобы когда устройство меняет ориентацию, то все клетки растягивались соответственно и ничего не вылетало за пределы экрана.

Мастер
5. При повороте устройства все черные клетки должны менять цвет :)
6. Сделайте так, чтобы доска при поворотах всегда строго находилась по центру

Супермен
8. Поставьте белые и красные шашки (квадратные вьюхи) так как они стоят на доске. Они должны быть сабвьюхами главной вьюхи (у них и у клеток один супервью)
9. После каждого переворота шашки должны быть перетасованы используя соответствующие методы иерархии UIView
*/


- (CGPoint) makeFirstPoint {
    NSInteger x = 0;
    NSInteger y = 0;
    if (self.view.bounds.size.height > self.view.bounds.size.width) {
        y = (self.view.bounds.size.height - self.view.bounds.size.width) / 2;
    } else {
        x = (self.view.bounds.size.width - self.view.bounds.size.height) / 2;
    }
    return CGPointMake(x, y);
}

- (CGRect) makeMainRect {
    NSInteger x = 0;
    NSInteger y = 0;
    if (self.view.bounds.size.height > self.view.bounds.size.width) {
        y = (self.view.bounds.size.height - self.view.bounds.size.width) / 2;
    } else {
        x = (self.view.bounds.size.width - self.view.bounds.size.height) / 2;
    }
    NSInteger size = self.view.bounds.size.height < self.view.bounds.size.width ?
                        self.view.bounds.size.height : self.view.bounds.size.width;
    
    self.sizeCell = size / 8;
    
    return CGRectMake(x, y, size, size);
}


@end
