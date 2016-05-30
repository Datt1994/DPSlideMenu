//
//  SlideMenuViewController.h
//  ShiponK
//
//  Created by datt on 28/02/1938 SAKA.
//  Copyright © 1938 SAKA com.zaptechsolution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPSlideMenuViewController : UIViewController


-(BOOL)menuBtnClick:(UIViewController *)m;
-(void)tap;
-(void)initSwipeAndTap:(UIViewController *)m;
-(void)PushBtnClick:(NSString *)str ViewController:(UIViewController*)vc
;
-(void)initView:(NSString *)str ViewController:(UIViewController*)vc
;

@end
