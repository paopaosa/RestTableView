//
//  EXNewsItem.m
//  restTableView
//
//  Created by macpps on 13-2-28.
//  Copyright (c) 2013年 Paopaosa. All rights reserved.
//

#import "EXNewsItem.h"

@implementation EXNewsItem

- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:self.newsID forKey:@"newsID"];
    [coder encodeObject:self.pic forKey:@"pic"];
    [coder encodeObject:self.shareText forKey:@"shareText"];
    [coder encodeObject:self.pubDate forKey:@"pubDate"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.content forKey:@"content"];
}

- (id) initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        self.newsID = [coder decodeObjectForKey:@"newsID"];
        self.pic = [coder decodeObjectForKey:@"pic"];
        self.shareText = [coder decodeObjectForKey:@"shareText"];
        self.pubDate = [coder decodeObjectForKey:@"pubDate"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.content = [coder decodeObjectForKey:@"content"];
    }
    return self;
}

@end
