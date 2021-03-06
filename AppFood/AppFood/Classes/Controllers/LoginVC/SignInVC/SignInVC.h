//
//  SignInVC.h
//  AppFood
//
//  Created by HHumorous on 3/16/18.
//  Copyright © 2018 ThanhSon. All rights reserved.
//

#import "BaseVC.h"
#import "MButton.h"

@interface SignInVC : BaseVC

@property (nonatomic, weak) IBOutlet UITextField *tfEmail;
@property (nonatomic, weak) IBOutlet UITextField *tfPassword;
@property (nonatomic, weak) IBOutlet MButton *btnLogin;
@property (nonatomic, weak) IBOutlet MButton *btnRegister;

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;


@end
