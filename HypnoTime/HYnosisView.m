//
//  HYnosisView.m
//  Hypnosister
//
//  Created by tirostiros on 15-1-6.
//  Copyright (c) 2015年 cn.com.tiros. All rights reserved.
//

#import "HYnosisView.h"

@implementation HYnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.cirleColor = [UIColor lightGrayColor];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contex, 10);
//    CGContextSetRGBStrokeColor(contex, 1, 0, 0, 1);
    CGContextSetStrokeColorWithColor(contex, [self.cirleColor CGColor]);
    CGSize shadow = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(contex, shadow, 2.0, color);
    float radius = 10;
    while (true)
    {
        // Drawing code

        CGContextAddArc(contex, self.bounds.size.width/2.0, self.bounds.size.height/2.0, radius, 0, M_PI*2.0, YES);
        CGContextStrokePath(contex);
        
        radius+=20;
        if (radius > self.bounds.size.width/2.0 || radius > self.bounds.size.height/2.0)
        {
            break;
        }
    }

}

-(void)setCirleColor:(UIColor *)cirleColor
{
    _cirleColor = cirleColor;
    [self setNeedsDisplay];
}


//第一处理器才能处理摇晃事件
-(BOOL)canBecomeFirstResponder
{
    return YES;
}


//处理摇晃事件回调函数
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self setCirleColor:[UIColor redColor]];
    }
    NSLog(@"motion began motion:%d,event %@",motion,event);
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motion end motion:%d,event %@",motion,event);

}

-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motion cancel motion:%d,event %@",motion,event);
}


@end
