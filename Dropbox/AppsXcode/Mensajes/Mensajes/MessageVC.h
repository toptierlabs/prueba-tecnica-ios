//
//  MessageVC.h
//  Mensajes
//
//  Created by Nicolas Rodriguez on 6/10/14.
//  Copyright (c) 2014 Nicolas Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

@property (weak, nonatomic) IBOutlet UITextField *txtContent;

- (IBAction)sendMessage:(id)sender;

@end
