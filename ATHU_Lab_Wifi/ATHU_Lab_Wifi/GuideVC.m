//
//  GuideVC.m
//  ATHU_Lab_Wifi
//
//  Created by Peaceminds on 14-4-6.
//  Copyright (c) 2014年 Peaceminds. All rights reserved.
//

#import "GuideVC.h"
#import "WifiCertificationVC.h"
#import "AppDelegate.h"

@interface GuideVC ()

@end

@implementation GuideVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)loadView
{
    UIView *guideView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    guideView.backgroundColor = [UIColor orangeColor];
    self.view = guideView; // 调试教训一：在loadview里初始化view一定要指定自己的view，否则会死循环的TAT……
    
    UIButton *guideButton = [[UIButton alloc] initWithFrame:CGRectMake(90, 100, 140, 35)];
    [guideButton setTitle:@"賣 _(:з」∠)_ 萌" forState:UIControlStateNormal];
    [guideButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [guideButton addTarget : self
                    action : @selector(pushWifiVC)
          forControlEvents : UIControlEventTouchUpInside];
    [self.view addSubview:guideButton];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Target Action
- (void)pushWifiVC
{
    WifiCertificationVC *wifiCertificate = [[WifiCertificationVC alloc] init];
    [self.navigationController pushViewController:wifiCertificate animated:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
