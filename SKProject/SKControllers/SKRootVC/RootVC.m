//
//  ViewController.m
//  SKProject
//
//  Created by shaveKevin on 15/7/2.
//  Copyright (c) 2015年 shaveKevin. All rights reserved.
//

#import "RootVC.h"
#import "SKConst.h"
#import "SKRuntimeProperty.h"
@interface RootVC ()
@end

@implementation RootVC
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SKRuntimeProperty *property = [SKRuntimeProperty new];
    UILabel *label = [UILabel new];
    label.text = @"13123";

    NSLog(@"%@",[property getAllIvar:label]);
    NSLog(@"%@",[property getAllProperty:label]);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
