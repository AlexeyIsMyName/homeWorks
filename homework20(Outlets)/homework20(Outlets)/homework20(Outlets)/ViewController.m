//
//  ViewController.m
//  homework20(Outlets)
//
//  Created by Алексей on 26/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
 
 ВСЕ ЗАДАНИЯ ДОЛЖНЫ БЫТЬ БЫПОЛНЕНЫ ТОЛЬКО ИСПОЛЬЗУЯ АУТЛЕТЫ.
 МЕТОД subviews НЕ ИСПОЛЬЗУЙТЕ, ВМЕСТО НЕГО ИСПОЛЬЗУЙТЕ АУТЛЕТ КОЛЛЕКЦИИ
 
 Ученик
 
 1! В цикле создавайте квадратные UIView с черным фоном и расположите их в виде шахматной доски
 2! доска должна иметь столько клеток, как и настоящая шахматная
 
 Студент
 
 3! Доска должна быть вписана в максимально возможный квадрат, т.е. либо бока, либо верх или низ должны касаться границ экрана
 4! Применяя соответствующие маски сделайте так, чтобы когда устройство меняет ориентацию, то все клетки растягивались соответственно и ничего не вылетало за пределы экрана.
 
 Мастер
 5! При повороте устройства все черные клетки должны менять цвет :)
 6! Сделайте так, чтобы доска при поворотах всегда строго находилась по центру
 
 Супермен
 8! Поставьте белые и красные шашки (квадратные вьюхи) так как они стоят на доске. Они должны быть сабвьюхами главной вьюхи (у них и у клеток один супервью)
 9! После каждого переворота шашки должны быть перетасованы используя соответствующие методы иерархии UIView
 
*/

- (UIInterfaceOrientationMask) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (CGFloat) randomFromZeroToOne {
    return (float)(arc4random() % 256) / 255;
}

- (UIColor *) randomColor {
    CGFloat r = [self randomFromZeroToOne];
    CGFloat g = [self randomFromZeroToOne];
    CGFloat b = [self randomFromZeroToOne];
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    UIColor *cellColor = [self randomColor];
    
    for (UIView *cell in self.cells) {
        cell.backgroundColor = cellColor;
    }
    
    NSInteger randomCountChange = arc4random() % ([self.figures count] / 2) + 1;
    
    for (NSInteger i = 0; i < randomCountChange; i++) {
        UIView *firstFigure = [self.figures objectAtIndex:arc4random() % [self.figures count]];
        UIView *secondFigure = [self.figures objectAtIndex:arc4random() % [self.figures count]];
        
        [UIView setAnimationsEnabled:YES];
        
        [UIView animateWithDuration:1 delay:1 options:0 animations:^{
            CGRect tempRect = firstFigure.frame;
            [firstFigure setFrame:secondFigure.frame];
            [secondFigure setFrame:tempRect];
            
            [self.mainField bringSubviewToFront:firstFigure];
            [self.mainField bringSubviewToFront:secondFigure];
        } completion:^(BOOL finished) {
        }];
    }
}

@end
