//
//  SwitchControlItems.m
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 4/8/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import "SwitchControlItems.h"

@implementation SwitchControlItems
@synthesize switchDelegate;

-(id) initWithFrame:(CGRect)frame andDelegate:(id <SwitchControlDelegate>)delegateObject
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.switchDelegate = delegateObject;
        self.on = [switchDelegate startPosition:self];
    }
    return self;
    
}

-(void)setOn:(BOOL)on animated:(BOOL)animated
{
    [super setOn:on animated:animated];
    if (switchDelegate != nil && [switchDelegate respondsToSelector:@selector(SwitchControlChanged:withValue:)])
    {
        [[self switchDelegate] SwitchControlChanged:self withValue:on];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
