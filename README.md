# DPSlideMenu
Slidemenu for ios application

1st Step-> import DPSlideMenuViewController in all ViewController

#import "DPSlideMenuViewController.h"



2nd Step-> Create object of DPSlideMenuViewController in all ViewController

@interface ViewController ()
{

    DPSlideMenuViewController *slideMenu;
    
}

3rd step-> alloc & init in all ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    slideMenu=[[DPSlideMenuViewController alloc]init]; // add this code

    
}


4th step-> In menu-ViewController assign first ViewController(use Storyboard id)  

/*

//For Initializing First ViewController (only give Storyboard id as a string)

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [slideMenu initView:@"view1_ViewController(use your Storyboard id)" ViewController:self];  //add this code 

    
}

5th step-> In menu-ViewController  add this code into button Action

//For Button Action - Push to that ViewController (only give Storyboard id as a string)

- (IBAction)btn2_Action:(id)sender {

     [slideMenu PushBtnClick:@"view2_ViewController(use your Storyboard id)" ViewController:self]; // add this code
    
}

*/

6th step-> In all other ViewControllers add this code 

/*

//For add Swipe and Tap Gesture

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [slideMenu initSwipeAndTap:self]; // add this code  
    
}

//For menu button click then  slide menu appear

- (IBAction)menu_btn_Action:(id)sender {

    [slideMenu menuBtnClick:self]; //add this code in menu button action

}







*/




