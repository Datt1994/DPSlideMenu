

#import "ViewController.h"
#import "DPSlideMenuViewController.h"
@interface ViewController (){
    
  DPSlideMenuViewController *slideMenu;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    slideMenu=[[DPSlideMenuViewController alloc]init];
    [slideMenu initView:@"view1_ViewController" ViewController:self];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn1_Action:(id)sender {
     [slideMenu PushBtnClick:[NSString stringWithFormat:@"view1_ViewController"] ViewController:self];
    
}

- (IBAction)btn2_Action:(id)sender {
     [slideMenu PushBtnClick:[NSString stringWithFormat:@"view2_ViewController"] ViewController:self];
}

- (IBAction)btn3_Action:(id)sender {
     [slideMenu PushBtnClick:[NSString stringWithFormat:@"view3_ViewController"] ViewController:self];
}



@end
