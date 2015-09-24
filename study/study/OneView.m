//
//  OneView.m
//  study
//
//  Created by luoshuai on 15/8/6.
//  Copyright (c) 2015年 WS. All rights reserved.
//

#import "OneView.h"

@implementation OneView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.startPoint = CGPointMake(.3, 0);
        gradient.endPoint = CGPointMake(1, 1);
        [gradient setFrame:self.bounds];
        [gradient setColors:@[(id)[UIColor orangeColor].CGColor,
                              (id)[UIColor purpleColor].CGColor]];
        [self.layer insertSublayer:gradient atIndex:0];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
