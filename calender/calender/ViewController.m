//
//  ViewController.m
//  calender
//
//  Created by 董诗磊 on 16/6/1.
//  Copyright © 2016年 董诗磊. All rights reserved.
//

#import "ViewController.h"
#import "CalenderHelper.h"
#import "CollectionViewCell.h"
#import "CalenderView.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一个月" style:UIBarButtonItemStylePlain target:self action:@selector(nextMouth)];
    
    CalenderView * view = [[CalenderView alloc]init];
       [self.view addSubview:view];
    view.sd_layout
    .topSpaceToView(self.view,64)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(240);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




















@end
