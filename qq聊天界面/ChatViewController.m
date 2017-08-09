//
//  ChatViewController.m
//  qq聊天界面
//
//  Created by chenlishuang on 16/10/20.
//  Copyright © 2016年 chenlishuang. All rights reserved.
//

#import "ChatViewController.h"
#import "MessageCell.h"
#import "Message.h"
@interface ChatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSArray *messages;
@end

@implementation ChatViewController
- (NSArray *)messages{
    if (!_messages) {
        //1.加载plist中的文件
        NSString *path = [[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //2.将数组中的字典转模型
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            Message *model = [Message messageWithDic:dic];
            [tempArray addObject:model];
        }
        _messages = tempArray;
    }
     return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-----代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"Message";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    cell.message = self.messages[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;//估算高度
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Message *message = self.messages[indexPath.row];
//    NSLog(@"!!!!%f",message.cellHeight);
    return message.cellHeight;
}
@end
