//
//  ViewController.m
//  PagingText
//
//  Created by Ive on 16/8/18.
//  Copyright © 2016年 Ive. All rights reserved.
//

#import "ViewController.h"
#import "PagingTextView.h"
@interface ViewController (){
    CGSize _contentSize;
    NSDictionary *_attributeDict;
    PagingTextView *_pagingTextView;
    CGFloat _fontSize;
}
@property (nonatomic,copy) NSString *fontName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"文本分隔";
    _contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) - 20, CGRectGetHeight(self.view.frame) - 100);
    _fontSize = 20;
    _fontName = @"PingFang SC";

    _attributeDict = @{NSFontAttributeName:[UIFont fontWithName:self.fontName size:_fontSize]};
    
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Text" ofType:@"txt"];
    NSString *string = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 20, CGRectGetWidth(self.view.frame)/2.0, 44);
    [button setTitle:@"A+" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(fontIncrease) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(CGRectGetWidth(self.view.frame)/2.0, 20, CGRectGetWidth(self.view.frame)/2.0, 44);
    [button1 setTitle:@"A-" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(fontDecrease) forControlEvents:UIControlEventTouchUpInside];
   [self.view addSubview:button1];
    

 
    
    _pagingTextView = [[PagingTextView alloc] initWithFrame:CGRectMake(10, 70, _contentSize.width, _contentSize.height)];
    _pagingTextView.attributeDict = _attributeDict;
    
    _pagingTextView.contentString = string;
    [self.view addSubview:_pagingTextView];

}


- (void)fontIncrease {
    _fontSize ++;
    _attributeDict = @{NSFontAttributeName:[UIFont fontWithName:self.fontName size:_fontSize]};
    
    [_pagingTextView updateAttributeDict:_attributeDict];
}

- (void)fontDecrease {
    _fontSize --;
    _attributeDict = @{NSFontAttributeName:[UIFont fontWithName:self.fontName size:_fontSize]};
    [_pagingTextView updateAttributeDict:_attributeDict];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
