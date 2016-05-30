//
//  view2_ViewController.m
//  DPmenu
//
//  Created by datt on 09/03/1938 SAKA.
//  Copyright © 1938 SAKA datt. All rights reserved.
//

#import "view2_ViewController.h"
#import "DPSlideMenuViewController.h"
@interface view2_ViewController (){
    DPSlideMenuViewController *slideMenu;
}


@end

@implementation view2_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    slideMenu =[[DPSlideMenuViewController alloc]init];
    [slideMenu initSwipeAndTap:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)menu_Action:(id)sender {
    [slideMenu menuBtnClick:self];
}
@end
