//
//  WifiCertificationVC.m
//  ATHU_Lab_Wifi
//
//  Created by Peaceminds on 14-4-6.
//  Copyright (c) 2014年 Peaceminds. All rights reserved.
//

#import "WifiCertificationVC.h"

@interface WifiCertificationVC ()

@end

@implementation WifiCertificationVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Wifi认证";
        [super viewDidLoad];
    }
    return self;
}

- (void)loadView
{
    /// 6.0 or 7.0 变量 各种颜色等常量
    
    NSString *dVersionStr = [[UIDevice currentDevice] systemVersion];
    double deviceVersion = [dVersionStr doubleValue];
    
    UIColor       *THUPurple = [UIColor colorWithRed : 188/255.0
                                               green : 156/255.0
                                                blue : 198/255.0
                                               alpha : 10];
    UIColor     *textColor01 = [UIColor colorWithRed : 62/255.0
                                               green : 62/255.0
                                                blue : 62/255.0
                                               alpha : 100];
    UIColor        *bgdColor = [UIColor colorWithRed : 252/255.0
                                               green : 252/255.0
                                                blue : 252/255.0
                                               alpha : 100];
    UIColor    *dividerColor = [UIColor colorWithRed : 178/255.0
                                               green : 178/255.0
                                                blue : 178/255.0
                                               alpha : 100];
    UIColor      *logInColor = [UIColor colorWithRed : 107/255.0
                                               green : 209/255.0
                                                blue : 255/255.0
                                               alpha : 100];
    UIColor     *logOutColor = [UIColor colorWithRed : 253/255.0
                                               green : 246/255.0
                                                blue : 183/255.0
                                               alpha : 100];
    UIColor *ohterLinksColor = [UIColor colorWithRed : 219/255.0
                                               green : 218/255.0
                                                blue : 218/255.0
                                               alpha : 100];
    
    /// 设置默认View
    
    UIView *wifiMainView = [[UIView alloc] initWithFrame : [[UIScreen mainScreen] applicationFrame]];
    wifiMainView.backgroundColor = bgdColor;
                       self.view = wifiMainView;
    
    /// 设置NavigationBar样式
    // 设置：Bar的颜色与Title字体颜色
    UINavigationBar *sfBar = self.navigationController.navigationBar;
    [sfBar setTitleTextAttributes : [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    if (deviceVersion < 7.0) {
        sfBar.backgroundColor = THUPurple;
    } else {
    // [csBar setBackgroundColor:THUPurple]; // 注释掉的为透明紫，目前使用实心紫
           sfBar.barTintColor = THUPurple;
              sfBar.TintColor = [UIColor whiteColor];
    }
    // 设置：右上按钮
    UIButton  *itemBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [itemBtn  setFrame : CGRectMake(215, 100, 71, 33)];
    [itemBtn setAlpha:0.0];
    [itemBtn  setTitle : @"网络信息" forState:UIControlStateNormal];
    [itemBtn addTarget : self
                action : @selector(checkNetState)
      forControlEvents : UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView : itemBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    /// 设置用户控件元素
    // 设置：标签
        userName = [[UILabel alloc] init];
         userPSW = [[UILabel alloc] init];
    currentState = [[UILabel alloc] init];
             [userName setText : @"账 号"];
             [userPSW setText  : @"密 码"];
         [currentState setText : @"状 态"];
        [userName setTextColor : textColor01];
         [userPSW setTextColor : textColor01];
    [currentState setTextColor : textColor01];
    // 设置：图片
             titleImage01 = [[UIImageView alloc] initWithImage : [UIImage imageNamed:@"Wifi_title_01-2"]];
             titleImage02 = [[UIImageView alloc] initWithImage : [UIImage imageNamed:@"Wifi_title_02-2"]];
          universityBadge = [[UIImageView alloc] initWithImage : [UIImage imageNamed:@"Wifi_badge"]];
    // 设置：分隔线
                    divider = [[UIImageView alloc] init];
    divider.backgroundColor = dividerColor;
    // 设置：文本框
    CertificateTF_UserName = [[UITextField alloc] init];
    CertificateTF_Password = [[UITextField alloc] init];
    CertificateTF_UserName.borderStyle = UITextBorderStyleRoundedRect;
    CertificateTF_Password.borderStyle = UITextBorderStyleRoundedRect;
    CertificateTF_UserName.placeholder = @"亲的用户名";
    CertificateTF_Password.placeholder = @"密码呦~";
    CertificateTF_UserName.clearButtonMode = UITextFieldViewModeWhileEditing;
    CertificateTF_Password.clearButtonMode = UITextFieldViewModeWhileEditing;
    CertificateTF_UserName.returnKeyType = UIReturnKeyDone;
    CertificateTF_Password.returnKeyType = UIReturnKeyDone;
    CertificateTF_Password.secureTextEntry = YES;
    // 设置：按钮
    if (deviceVersion < 7.0) {
    
        logInButton = [UIButton buttonWithType : UIButtonTypeCustom];
        logOutButton = [UIButton buttonWithType : UIButtonTypeCustom];
        otherLinksButton = [UIButton buttonWithType : UIButtonTypeCustom];
        [logInButton setTitle : @"立即登录" forState:UIControlStateNormal];
        [logOutButton setTitle : @"下线登出" forState:UIControlStateNormal];
        [otherLinksButton setTitle : @"管理其他设备的连接" forState:UIControlStateNormal];
        [logInButton setTitleColor : [UIColor whiteColor] forState:UIControlStateNormal];
        [otherLinksButton setTitleColor : [UIColor whiteColor] forState:UIControlStateNormal];
        [logOutButton setTitleColor : textColor01 forState:UIControlStateNormal];
        [logInButton setBackgroundColor : logInColor];
        [logOutButton setBackgroundColor : logOutColor];
        [otherLinksButton setBackgroundColor : ohterLinksColor];

    } else {
         logInButton = [UIButton buttonWithType : UIButtonTypeRoundedRect];
        logOutButton = [UIButton buttonWithType : UIButtonTypeRoundedRect];
    otherLinksButton = [UIButton buttonWithType : UIButtonTypeRoundedRect];
                   [logInButton setTitle : @"立即登录" forState:UIControlStateNormal];
                  [logOutButton setTitle : @"下线登出" forState:UIControlStateNormal];
              [otherLinksButton setTitle : @"管理其他设备的连接" forState:UIControlStateNormal];
              [logInButton setTitleColor : [UIColor whiteColor] forState:UIControlStateNormal];
         [otherLinksButton setTitleColor : [UIColor whiteColor] forState:UIControlStateNormal];
             [logOutButton setTitleColor : textColor01 forState:UIControlStateNormal];
         [logInButton setBackgroundColor : logInColor];
        [logOutButton setBackgroundColor : logOutColor];
    [otherLinksButton setBackgroundColor : ohterLinksColor];
    }

    /// 适配控件位置
    
    if (deviceVersion < 7.0) {
                      [userName setFrame : CGRectMake(49, 95, 50, 50)];
                       [userPSW setFrame : CGRectMake(49, 135, 50, 50)];
                  [currentState setFrame : CGRectMake(49, 175, 50, 50)];
                  [titleImage01 setFrame : CGRectMake(83, 50, 160, 33)];
                  [titleImage02 setFrame : CGRectMake(78, 318, 162, 33)];
               [universityBadge setFrame : CGRectMake(208, 320, 90, 90)];
                       [divider setFrame : CGRectMake(0, 302, 320, 1)];
        [CertificateTF_UserName setFrame : CGRectMake(105, 105, 168, 30)];
        [CertificateTF_Password setFrame : CGRectMake(105, 145, 168, 30)];
                   [logInButton setFrame : CGRectMake(0, 245, 161, 36)];
                  [logOutButton setFrame : CGRectMake(161, 245, 160, 36)];
              [otherLinksButton setFrame : CGRectMake(0, 379, 320, 36)];
    } else {
                      [userName setFrame : CGRectMake(49, 135, 50, 50)];
                       [userPSW setFrame : CGRectMake(49, 175, 50, 50)];
                  [currentState setFrame : CGRectMake(49, 215, 50, 50)];
                  [titleImage01 setFrame : CGRectMake(83, 90, 160, 33)];
                  [titleImage02 setFrame : CGRectMake(78, 380, 162, 33)];
               [universityBadge setFrame : CGRectMake(208, 380, 90, 90)];
                       [divider setFrame : CGRectMake(0, 352, 320, 1)];
        [CertificateTF_UserName setFrame : CGRectMake(105, 145, 168, 30)];
        [CertificateTF_Password setFrame : CGRectMake(105, 185, 168, 30)];
                   [logInButton setFrame : CGRectMake(0, 290, 161, 40)];
                  [logOutButton setFrame : CGRectMake(161, 290, 160, 40)];
              [otherLinksButton setFrame : CGRectMake(0, 439, 320, 40)];
    }

    /// 将视图添加到View上
    // 注意：“其他链接”按钮要覆盖校徽
    [self.view addSubview : userName];
    [self.view addSubview : userPSW];
    [self.view addSubview : CertificateTF_UserName];
    [self.view addSubview : CertificateTF_Password];
    [self.view addSubview : currentState];
    [self.view addSubview : titleImage01];
    [self.view addSubview : titleImage02];
    [self.view addSubview : divider];
    [self.view addSubview : logInButton];
    [self.view addSubview : logOutButton];
    [self.view addSubview : universityBadge];
    [self.view addSubview : otherLinksButton];

}

- (void)viewDidLoad
{
// 键盘消失的代理要写在这里！！！
    CertificateTF_UserName.delegate = self;
    CertificateTF_Password.delegate = self;
}

# pragma mark - Delegate  以下三个方法分别为：输入文字时界面自动上浮，结束编辑时隐藏键盘的方法（有代理之后即会自动以代理方式实现）
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    CGFloat keyboardHeight = 216.0f;
    if (self.view.frame.size.height - keyboardHeight <= textField.frame.origin.y + textField.frame.size.height) {
        CGFloat y = textField.frame.origin.y - (self.view.frame.size.height - keyboardHeight - textField.frame.size.height - 5);
        [UIView beginAnimations:@"srcollView" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.275f];
        self.view.frame = CGRectMake(self.view.frame.origin.x, -y, self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [UIView beginAnimations:@"srcollView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.275f];
    self.view.frame = CGRectMake(self.view.frame.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}

# pragma mark - Actions 自定义的动作和方法
- (void)checkNetState
{
    UIAlertView * netStateAlert = [[UIAlertView alloc] initWithTitle : @"当前网络状态"
                                                             message : @"其实我也不知道。。。"
                                                            delegate : nil
                                                   cancelButtonTitle : @"好吧"
                                                   otherButtonTitles : @"问问洲洋酱", nil];
    [netStateAlert show];
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
