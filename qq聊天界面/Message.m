//
//  Message.m
//  qq聊天界面
//
//  Created by chenlishuang on 16/10/20.
//  Copyright © 2016年 chenlishuang. All rights reserved.
//

#import "Message.h"

@implementation Message
+ (instancetype)messageWithDic:(NSDictionary *)dic{
    Message *message = [[self alloc]init];
    [message setValuesForKeysWithDictionary:dic];
    return message;
}
@end
