//
//  Message.h
//  qq聊天界面
//
//  Created by chenlishuang on 16/10/20.
//  Copyright © 2016年 chenlishuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,MessageType) {
    MessageTypeME = 0,
    MessageTypeOther = 1
};
@interface Message : NSObject
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *time;
//@property(nonatomic,copy)<#类型#> *<#名称#>;
//@property(nonatomic,assign,getter=isme)BOOL type;
@property(nonatomic,assign)MessageType type;

//辅助属性
@property (assign,nonatomic)CGFloat cellHeight;
+ (instancetype)messageWithDic:(NSDictionary *)dic;
@end
