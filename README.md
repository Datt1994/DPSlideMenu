# DPSlideMenu
Slidemenu for ios application


//For Initializing First View
- (void)viewDidLoad {
    [super viewDidLoad];
    DPSlideMenuViewController *slideMenu;
    slideMenu=[[DPSlideMenuViewController alloc]init];
    [slideMenu initView:@"view1_ViewController" ViewController:self];

    
}

//For Push ViewController
- (IBAction)btn1_Action:(id)sender {
     [slideMenu PushBtnClick:[NSString stringWithFormat:@"view1_ViewController"] ViewController:self];
    
}



//For Swipe and Tap
- (void)viewDidLoad {
    [super viewDidLoad];
    slideMenu =[[DPSlideMenuViewController alloc]init];
    [slideMenu initSwipeAndTap:self];
    // Do any additional setup after loading the view.
}



//For slide menu appear
- (IBAction)menu_Action:(id)sender {
    [slideMenu menuBtnClick:self];
}
