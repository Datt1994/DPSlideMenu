//
//  DPSlideMenuViewController.m
//  DPmenu
//
//  Created by datt on 30/05/2016.
//  Copyright © 2016  datt. All rights reserved.
//

#import "DPSlideMenuViewController.h"


@interface DPSlideMenuViewController ()
{
    UIViewController *mainViewController;
    UITapGestureRecognizer *tap;
    BOOL menuclick;
    
    
    UIViewController *objViewController;
    
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
    mainViewController=m;
    
    tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [mainViewController.view addGestureRecognizer:tap];
    
    
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToLeftWithGesture)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [m.view addGestureRecognizer:swipeLeft];
    
    
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToRightWithGesture)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [m.view addGestureRecognizer:swipeRight];
    
    
}

-(void)menuBtnClick:(UIViewController *)m{
    
    mainViewController=m;
    
    
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
    
    
}
-(void)tap
{
    
    
    if (menuclick==YES) {
        
        
        [UIView animateWithDuration:.5 animations:^{
            
            mainViewController.view.frame =CGRectOffset(mainViewController.view.frame,-(mainViewController.view.frame.size.width-85),0);
            
        }];
        menuclick=NO;
        
    }
    
    
}
-(void)slideToLeftWithGesture{
    if (menuclick==YES) {
        
        [UIView animateWithDuration:.5 animations:^{
            mainViewController.view.frame =CGRectOffset(mainViewController.view.frame, -(mainViewController.view.frame.size.width-85),0);
            
        }];
        
        
        menuclick=NO;
    }
    
    
}
-(void)slideToRightWithGesture{
    
    if (menuclick==NO) {
        
        [UIView animateWithDuration:.5 animations:^{
            mainViewController.view.frame =CGRectOffset(mainViewController.view.frame, mainViewController.view.frame.size.width-85,0);
            
        }];
        menuclick=YES;
    }
    
    
}
-(void)initView:(NSString *)str ViewController:(UIViewController*)vc

{
    objViewController = (UIViewController *) [[UIStoryboard storyboardWithName:@"Main" bundle:nil]        instantiateViewControllerWithIdentifier:str];
    
    [vc.view addSubview:objViewController.view];
    [vc addChildViewController:objViewController];
    [objViewController didMoveToParentViewController:vc];
    
}

-(void)PushBtnClick:(NSString *)str ViewController:(UIViewController*)vc BouncingAnimation:(BOOL)bounc
{
    [objViewController.view removeFromSuperview];
    
    [objViewController removeFromParentViewController];
    
    [objViewController didMoveToParentViewController:nil];
    
    
    
    
    objViewController = (UIViewController *) [[UIStoryboard storyboardWithName:@"Main" bundle:nil]        instantiateViewControllerWithIdentifier:str] ;
    [vc.view addSubview:objViewController.view];
    [vc addChildViewController:objViewController];
    [objViewController didMoveToParentViewController:vc];
   

    
    if (bounc==YES) {
        CGFloat midWidth = vc.view.frame.size.width*.5;
        CAKeyframeAnimation *animation = [[self class] dockBounceAnimationWithViewWidth:midWidth];
        [objViewController.view.layer addAnimation:animation forKey:@"bouncing"];
        
    }
    else{
        
    
        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = @"position.x";
        animation.fromValue = @(vc.view.frame.size.width+80);
        animation.toValue = @(vc.view.frame.size.width/2);
        animation.duration = .35;
        
        [objViewController.view.layer addAnimation:animation forKey:@"basic"];

    }
    

    
    
    
}

+ (CAKeyframeAnimation*)dockBounceAnimationWithViewWidth:(CGFloat)viewWidth
{
    NSUInteger const kNumFactors    = 16;
    CGFloat const kFactorsPerSec    = 30.0f;
    CGFloat const kFactorsMaxValue  = 100.0f;
    CGFloat factors[kNumFactors]    = {0,  60, 83, 100, 100, 83, 60, 32, 0, 0, 18, 28, 32, 28, 18, 0};
    
    NSMutableArray* transforms = [NSMutableArray array];
    
    for(NSUInteger i = 0; i < kNumFactors; i++)
    {
        CGFloat positionOffset  = factors[i] / kFactorsMaxValue * viewWidth;
        CATransform3D transform = CATransform3DMakeTranslation(positionOffset,0.0f,  0.0f);
        
        [transforms addObject:[NSValue valueWithCATransform3D:transform]];
    }
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.repeatCount           = 1;
    animation.duration              = kNumFactors * 1.0f/kFactorsPerSec;
    animation.fillMode              = kCAFillModeForwards;
    animation.values                = transforms;
    animation.removedOnCompletion   = YES; // final stage is equal to starting stage
    animation.autoreverses          = NO;
    
    return animation;
}

@end
