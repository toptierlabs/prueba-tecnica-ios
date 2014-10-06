//
//  ApiVC.h
//  Mensajes
//
//  Created by Nicolas Rodriguez on 6/10/14.
//  Copyright (c) 2014 Nicolas Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApiVC : UIViewController
////////////////////////////SINGLETON//////////////////////////////////
+(ApiVC *) getInstance;
//////////////////////////////////////////////////////////////////////

@property (nonatomic,strong) NSString * url;

- (NSMutableDictionary *)getAllMessageApi;
- (void)sendMessage:(NSMutableDictionary*)message;

@end
