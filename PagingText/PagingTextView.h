//
//  PagingTextView.h
//  MyDemo
//
//  Created by Ive on 16/8/17.
//  Copyright © 2016年 XQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PagingTextView : UIView
@property (nonatomic,strong) NSDictionary *attributeDict;
@property (nonatomic,copy) NSString *contentString;
@property (nonatomic,assign) NSInteger currentPage;
- (void)updateAttributeDict:(NSDictionary *)attributeDict;
- (BOOL)nextPage;
- (BOOL)lastPage;
@end
