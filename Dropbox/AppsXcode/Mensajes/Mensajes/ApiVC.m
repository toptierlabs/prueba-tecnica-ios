//
//  ApiVC.m
//  Mensajes
//
//  Created by Nicolas Rodriguez on 6/10/14.
//  Copyright (c) 2014 Nicolas Rodriguez. All rights reserved.
//

#import "ApiVC.h"

@interface ApiVC ()

@end

@implementation ApiVC

////////////////////////////SINGLETON//////////////////////////////////

+(ApiVC *) getInstance{ // Singleton APIProxi
    static  ApiVC *inst = nil;
    @synchronized(self){
        if (!inst) {
            inst = [[self alloc] init];
            inst.url= @"http://0.0.0.0:3000";
        }
    }
    return inst;
}
//////////////////////////////////////////////////////////////////////

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableDictionary *)getAllMessageApi{
    ApiVC * api = [ApiVC getInstance];
    
    NSString * urlString = [NSString stringWithFormat:@"%@%@",api.url,@"/messages"];//Produccion
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"GET"];
    
    NSHTTPURLResponse *response;
    NSError *err;
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    
    NSMutableDictionary * jsonObject;
    jsonObject = [NSJSONSerialization JSONObjectWithData:data//CAPTURO LO QUE SUCEDIO CON EL POST
                                                 options:NSJSONReadingMutableContainers
                                                   error:&err];
    
    return jsonObject;
    
    // Do any additional setup after loading the view.
    
}

- (void)sendMessage:(NSMutableDictionary*)message {
    ApiVC * api = [ApiVC getInstance];
    
    NSError *error = nil;
    NSString * urlString = [NSString stringWithFormat:@"%@%@",api.url,@"/messages"];//Produccion
    NSURL * url=[NSURL URLWithString:urlString];
    
    NSDictionary *post = [NSDictionary dictionaryWithObjectsAndKeys:[message valueForKey:@"message"], @"message", nil];
    
    NSData* postData = [NSJSONSerialization dataWithJSONObject:post options:kNilOptions error:&error];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSHTTPURLResponse *response;
    
    
    NSError *err;
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    
    NSMutableDictionary * jsonObject;
    jsonObject = [NSJSONSerialization JSONObjectWithData:data//CAPTURO LO QUE SUCEDIO CON EL POST
                                                 options:NSJSONReadingMutableContainers
                                                   error:&err];
    
    
    
    
    
}

@end
