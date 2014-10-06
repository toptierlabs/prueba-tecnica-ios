//
//  MainVC.m
//  Mensajes
//
//  Created by Nicolas Rodriguez on 6/10/14.
//  Copyright (c) 2014 Nicolas Rodriguez. All rights reserved.
//

#import "MainVC.h"
#import "ApiVC.h"

@interface MainVC ()

@end

@implementation MainVC
@synthesize list,table;

- (void)viewDidLoad {
    [super viewDidLoad];
    ApiVC * apiVC = [ApiVC getInstance];
    list = [[NSMutableDictionary alloc]init];
    list = [apiVC getAllMessageApi];
    

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    ///// Capturo los datos de la api en estas variables ////////
    
    //INTEGER VALUE convierte ese valor de string a int
    NSString * email =[[list valueForKey:@"name"] objectAtIndex:indexPath.row];
    NSString * content =[[list valueForKey:@"content"] objectAtIndex:indexPath.row];

    

    cell.textLabel.text = email;
    cell.detailTextLabel.text = content;
    
    return cell;
}


@end
