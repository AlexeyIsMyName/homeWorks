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
@property (assign, nonatomic) double sizeCell;
@property (assign, nonatomic) double sizeFigure;
@property (strong, nonatomic) NSMutableArray *figuresArray;
@property (strong, nonatomic) UIView *mainView;

- (CGRect) makeMainRect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIView setAnimationsEnabled:YES];
    // Do any additional setup after loading the view.
    /*
     Ученик
     1! В цикле создавайте квадратные UIView с черным фоном и расположите их в виде шахматной доски
     2! доска должна иметь столько клеток, как и настоящая шахматная
     Студент
     3! Доска должна быть вписана в максимально возможный квадрат, т.е. либо бока, либо верх или низ должны касаться границ экрана
     4! Применяя соответствующие маски сделайте так, чтобы когда устройство меняет ориентацию, то все клетки растягивались соответственно и ничего не вылетало за пределы экрана.
    */
    
    CGRect mainRect = [self makeMainRect];
    
    self.mainView = [[UIView alloc] initWithFrame:mainRect];
    self.mainView.backgroundColor = [UIColor whiteColor];
    
    self.mainView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                                     UIViewAutoresizingFlexibleLeftMargin |
                                     UIViewAutoresizingFlexibleBottomMargin |
                                     UIViewAutoresizingFlexibleRightMargin;
    
    [self.view addSubview:self.mainView];
    
    NSInteger x = self.sizeCell;
    NSInteger y = 0;
    CGRect cellRect = CGRectZero;
    
    for (int indexY = 0; indexY < 8; indexY++) {
        for (int indexX = 0; indexX < 4; indexX++) {
            cellRect = CGRectMake(x, y, self.sizeCell, self.sizeCell);
            UIView *cellView = [[UIView alloc] initWithFrame:cellRect];
            cellView.backgroundColor = [UIColor blackColor];
            [self.mainView addSubview:cellView];
            x = x + (self.sizeCell * 2);
        }
        y = y + self.sizeCell;
        x = (indexY % 2 == 0) ? 0 : self.sizeCell;
    }
    
    /*
     Супермен
     8! Поставьте белые и красные шашки (квадратные вьюхи) так как они стоят на доске. Они должны быть сабвьюхами главной вьюхи (у них и у клеток один супервью)
     9! После каждого переворота шашки должны быть перетасованы используя соответствующие методы иерархии UIView
    */
    
    self.figuresArray = [[NSMutableArray alloc] init];
    
    double ratioFigureByCell = 0.6;
    double different = (self.sizeCell - self.sizeCell * ratioFigureByCell) / 2;
    self.sizeFigure = self.sizeCell * ratioFigureByCell;
    self.sizeFigure = self.sizeCell * ratioFigureByCell - 2;
    
    x = self.sizeCell;
    y = 0;
    CGRect figureRect = CGRectZero;
    
    for (int indexX = 1; indexX < 9; indexX++) {
        for (int indexY = 1; indexY < 9; indexY++) {
            
            figureRect = CGRectMake(x + different, y + different, self.sizeFigure, self.sizeFigure);
            UIView *figureView = [[UIView alloc] initWithFrame:figureRect];
            
            figureView.autoresizingMask =   UIViewAutoresizingFlexibleTopMargin |
                                            UIViewAutoresizingFlexibleLeftMargin |
                                            UIViewAutoresizingFlexibleBottomMargin |
                                            UIViewAutoresizingFlexibleRightMargin;
            
            if (((indexX % 2) != (indexY % 2)) && indexX < 3) {
                figureView.backgroundColor = [UIColor redColor];
                [self.mainView addSubview:figureView];
                x = x + (self.sizeCell * 2);
                [self.figuresArray addObject:figureView];
            } else if (((indexX % 2) != (indexY % 2)) && indexX > 6) {
                figureView.backgroundColor = [UIColor blueColor];
                [self.mainView addSubview:figureView];
                x = x + (self.sizeCell * 2);
                [self.figuresArray addObject:figureView];
            }
        }
        y = y + self.sizeCell;
        x = (indexX % 2 != 0) ? 0 : self.sizeCell;
    }
}

- (UIInterfaceOrientationMask) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

/*
 Мастер
 5! При повороте устройства все черные клетки должны менять цвет :)
 6! Сделайте так, чтобы доска при поворотах всегда строго находилась по центру
*/

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation)) {
        UIView *mainView = [self.view.subviews objectAtIndex:0];
        UIColor *color = [UIColor colorWithRed:0.8
                                         green:0.8
                                          blue:1
                                         alpha:1];
        
        mainView.backgroundColor = color;
        
        for (UIView *cellView in mainView.subviews) {
            if (cellView.frame.size.width == self.sizeCell) {
                cellView.backgroundColor = [UIColor brownColor];
            }
        }
    }
    
    if (UIInterfaceOrientationIsLandscape(interfaceOrientation)) {
        UIView *mainView = [self.view.subviews objectAtIndex:0];
        mainView.backgroundColor = [UIColor whiteColor];
        
        for (UIView *cellView in mainView.subviews) {
            if (cellView.frame.size.width == self.sizeCell) {
                cellView.backgroundColor = [UIColor blackColor];
            }
        }
    }
    
    NSInteger randomCountChange = arc4random() % ([self.figuresArray count] / 2) + 1;
    
    for (NSInteger i = 0; i < randomCountChange; i++) {
        UIView *firstFigure = [self takeRandomFigure];
        UIView *secondFigure = [self takeRandomFigure];
        
        [UIView animateWithDuration:1 delay:1 options:0 animations:^{
            CGRect tempRect = firstFigure.frame;
            [firstFigure setFrame:secondFigure.frame];
            [secondFigure setFrame:tempRect];
        } completion:^(BOOL finished) {
        }];
    }
}

- (UIView *) takeRandomFigure {
    return [self.figuresArray objectAtIndex:arc4random() % [self.figuresArray count]];
}

- (CGRect) makeMainRect {
    NSInteger x = 0;
    NSInteger y = 0;
    
    if (self.view.bounds.size.height > self.view.bounds.size.width) {
        y = (self.view.bounds.size.height - self.view.bounds.size.width) / 2;
    } else {
        x = (self.view.bounds.size.width - self.view.bounds.size.height) / 2;
    }
    
    NSInteger size = MIN(self.view.bounds.size.height, self.view.bounds.size.width);
    
    self.sizeCell = size / 8;
    
    return CGRectMake(x, y, size, size);
}

@end
