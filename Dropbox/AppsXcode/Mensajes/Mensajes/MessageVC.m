//
//  MessageVC.m
//  Mensajes
//
//  Created by Nicolas Rodriguez on 6/10/14.
//  Copyright (c) 2014 Nicolas Rodriguez. All rights reserved.
//

#import "MessageVC.h"
#import "ApiVC.h"

@interface MessageVC ()

@end

@implementation MessageVC
@synthesize txtContent,txtEmail;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sendMessage:(id)sender {
    ApiVC * apiVC = [ApiVC getInstance];
    NSMutableDictionary * contentMessage = [[NSMutableDictionary alloc]init];
    NSMutableDictionary * message = [[NSMutableDictionary alloc]init];

    
    [contentMessage setValue:txtEmail.text forKey:@"name"];
    [contentMessage setValue:txtContent.text forKey:@"content"];
    [message setValue:contentMessage forKey:@"message"];
     
    [apiVC sendMessage:message];
    

    
}
@end
