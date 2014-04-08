//
//  SwitchControlItems.h
//  seagullcentury-iOS
//
//  Created by Brandon Altvater on 4/8/14.
//  Copyright (c) 2014 Salisbury University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchControlItems;

@protocol SwitchControlDelegate <NSObject>

@optional
-(void) SwitchControlChanged:(SwitchControlItems *)SwitchControlItems withValue:(BOOL)value;
@required
-(BOOL) startPosition:(SwitchControlItems *)SwitchControlItems;

@end

@interface SwitchControlItems : UISwitch

@property(nonatomic, assign) id <SwitchControlDelegate> switchDelegate;

-(id) initWithFrame:(CGRect)frame andDelegate:(id <SwitchControlDelegate>)delegateObject;


@end
