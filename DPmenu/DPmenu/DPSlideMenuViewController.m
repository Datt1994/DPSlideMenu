//
//  SlideMenuViewController.m
//  ShiponK
//
//  Created by datt on 28/02/1938 SAKA.
//  Copyright © 1938 SAKA com.zaptechsolution. All rights reserved.
//

#import "DPSlideMenuViewController.h"


@interface DPSlideMenuViewController ()
{
    UIViewController *tm;
    UITapGestureRecognizer *tap;
    BOOL menuclick;
    
    UIViewController *firstViewController;
    
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DPSlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initSwipeAndTap:(UIViewController *)m{
    tm=m;
    
    tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [tm.view addGestureRecognizer:tap];
    

    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToLeftWithGesture)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [m.view addGestureRecognizer:swipeLeft];
    
    
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToRightWithGesture)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [m.view addGestureRecognizer:swipeRight];

    
}

-(BOOL)menuBtnClick:(UIViewController *)m{
//
    tm=m;
    
    
    if (menuclick==NO) {
        
        
        [UIView animateWithDuration:.5 animations:^{
            m.view.frame =CGRectOffset(m.view.frame, m.view.frame.size.width-85,0);
            
        }];
        menuclick=YES;
    }
    else{
        [UIView animateWithDuration:.5 animations:^{
            m.view.frame =CGRectOffset(m.view.frame,-(m.view.frame.size.width-85),0);
            
        }];
        menuclick=NO;
        
    }
    return m;

    
    
}
-(void)tap
{
    

    if (menuclick==YES) {
        

        [UIView animateWithDuration:.5 animations:^{
            
            tm.view.frame =CGRectOffset(tm.view.frame,-(tm.view.frame.size.width-85),0);
            
        }];
        menuclick=NO;
        
    }

    
}
-(void)slideToLeftWithGesture{
    if (menuclick==YES) {
        
        [UIView animateWithDuration:.5 animations:^{
            tm.view.frame =CGRectOffset(tm.view.frame, -(tm.view.frame.size.width-85),0);
            
        }];

        
        menuclick=NO;
    }

    
}
-(void)slideToRightWithGesture{
    
    if (menuclick==NO) {
        
        [UIView animateWithDuration:.5 animations:^{
            tm.view.frame =CGRectOffset(tm.view.frame, tm.view.frame.size.width-85,0);
            
        }];
               menuclick=YES;
    }

    
}
-(void)initView:(NSString *)str ViewController:(UIViewController*)vc

{
        firstViewController = (UIViewController *) [[UIStoryboard storyboardWithName:@"Main" bundle:nil]        instantiateViewControllerWithIdentifier:str];
    
        [vc.view addSubview:firstViewController.view];
        [vc addChildViewController:firstViewController];
        [firstViewController didMoveToParentViewController:vc];
    
}

-(void)PushBtnClick:(NSString *)str ViewController:(UIViewController*)vc
{
    [firstViewController.view removeFromSuperview];
    
    [firstViewController removeFromParentViewController];
    
    [firstViewController didMoveToParentViewController:nil];
    
    
    
    
    firstViewController = (UIViewController *) [[UIStoryboard storyboardWithName:@"Main" bundle:nil]        instantiateViewControllerWithIdentifier:str] ;
    
    [vc.view addSubview:firstViewController.view];
    [vc addChildViewController:firstViewController];
    [firstViewController didMoveToParentViewController:vc];
   
    
    CABasicAnimation *animation = [CABasicAnimation animation];
      animation.keyPath = @"position.x";
    animation.fromValue = @(vc.view.frame.size.width+80);
    animation.toValue = @(vc.view.frame.size.width/2);
    animation.duration = .35;

    [firstViewController.view.layer addAnimation:animation forKey:@"basic"];


    
}

@end
