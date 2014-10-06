//
//  MainVC.h
//  Mensajes
//
//  Created by Nicolas Rodriguez on 6/10/14.
//  Copyright (c) 2014 Nicolas Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController

@property (nonatomic,strong) NSMutableDictionary * list;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
