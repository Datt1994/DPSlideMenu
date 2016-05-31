//  DPSlideMenuViewController.h
//  DPmenu
//
//  Created by datt on 30/05/2016.
//  Copyright © 2016  datt. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface DPSlideMenuViewController : UIViewController


-(void)menuBtnClick:(UIViewController *)m;
-(void)tap;
-(void)initSwipeAndTap:(UIViewController *)m;
-(void)PushBtnClick:(NSString *)str ViewController:(UIViewController*)vc;
-(void)initView:(NSString *)str ViewController:(UIViewController*)vc;

@end
