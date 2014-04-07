//
//  WifiCertificationVC.h
//  ATHU_Lab_Wifi
//
//  Created by Peaceminds on 14-4-6.
//  Copyright (c) 2014年 Peaceminds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WifiCertificationVC : UIViewController <UITextFieldDelegate>
{
       UILabel  * userName;
       UILabel  * userPSW;
       UILabel  * currentState;
       UIButton * logInButton;
       UIButton * logOutButton;
       UIButton * otherLinksButton;
    UIImageView * universityBadge;
    UITextField * CertificateTF_UserName;
    UITextField * CertificateTF_Password;
    UIImageView * titleImage01;
    UIImageView * titleImage02;
    UIImageView * divider;
}
@end
