//
//  ViewController.m
//  01-触摸
//
//  Created by qingyun on 15/12/11.
//  Copyright © 2015年 阿六. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cyanView;
@property (weak, nonatomic) IBOutlet UIImageView *megentView;
@property (weak, nonatomic) IBOutlet UIImageView *yellowView;

@end

@implementation ViewController

//取到触摸的点
- (CGPoint)getPoint:(NSSet <UITouch *> *)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    return point;
}
//判断当前点击的点是否在imageView的区域内
- (BOOL)imageViewContainsPoint:(CGPoint)point
{
    if (CGRectContainsPoint(_cyanView.frame, point) || CGRectContainsPoint(_megentView.frame, point) || CGRectContainsPoint(_yellowView.frame, point)) {
        return YES;
    }
    return NO;
}

- (void)setImageViewFrame
{
    [UIView animateWithDuration:0.5 animations:^{
        _cyanView.frame = CGRectMake(20, 78, 100, 100);
        _megentView.frame = CGRectMake(137, 284, 100, 100);
        _yellowView.frame = CGRectMake(255, 479, 100, 100);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //先取出触摸点
    CGPoint point = [self getPoint:touches];
    //取出触摸
    UITouch *touch = [touches anyObject];
    if ([self imageViewContainsPoint:point]) {
        //取出触摸的视图
        UIImageView *view = (UIImageView *)touch.view;
        [UIView animateWithDuration:0.5 animations:^{
            view.center = point;
            view.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
    }else
    {
        if (touch.tapCount == 2) {
            [self setImageViewFrame];
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [self getPoint:touches];
    
    if (CGRectContainsPoint(_cyanView.frame, point)) {
        [UIView animateWithDuration:0.3 animations:^{
            _cyanView.center = point;
        }];
        
    }
    if (CGRectContainsPoint(_megentView.frame, point))
    {
        [UIView animateWithDuration:0.3 animations:^{
            _megentView.center = point;
        }];
    }
    if (CGRectContainsPoint(_yellowView.frame, point))
    {
        [UIView animateWithDuration:0.3 animations:^{
            _yellowView.center = point;
        }];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    UIImageView *view = (UIImageView *)touch.view;
    [UIView animateWithDuration:0.3 animations:^{
        view.transform = CGAffineTransformIdentity;
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
