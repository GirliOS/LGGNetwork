//
//  ViewController.m
//  LGGNetwork
//
//  Created by girlios on 8/10/15.
//  Copyright (c) 2015 GirliOS. All rights reserved.
//

#import "ViewController.h"
#import "LGGNetEngine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)loginAction:(id)sender {
    
    [LGGNetEngine loginWithUserId:@"111111" password:@"123654" success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
