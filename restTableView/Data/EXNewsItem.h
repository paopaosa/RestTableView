//
//  EXNewsItem.h
//  restTableView
//
//  Created by macpps on 13-2-28.
//  Copyright (c) 2013年 Paopaosa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EXNewsItem : NSObject

@property (nonatomic,copy) NSString *newsID;
@property (nonatomic,copy) NSString *pic;
@property (nonatomic,copy) NSString *shareText;
@property (nonatomic,copy) NSString *pubDate;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *content;

@end
