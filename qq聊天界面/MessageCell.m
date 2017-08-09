//
//  MessageCell.m
//  qq聊天界面
//
//  Created by chenlishuang on 16/10/20.
//  Copyright © 2016年 chenlishuang. All rights reserved.
//

#import "MessageCell.h"
#import "Message.h"
#import <Masonry.h>
@interface MessageCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *chatButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UIImageView *otherImage;
@property (weak, nonatomic) IBOutlet UIButton *otherChatButton;

@end
@implementation MessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.chatButton.titleLabel.numberOfLines = 0;
    self.otherChatButton.titleLabel.numberOfLines = 0;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMessage:(Message *)message{
    _message = message;
    //设置数据
    self.timeLabel.text = message.time;
    if (self.message.type == MessageTypeME) {
        self.chatButton.hidden = NO;
        self.iconImage.hidden = NO;
        self.otherImage.hidden = YES;
        self.otherChatButton.hidden = YES;
        [self.chatButton setTitle:message.text forState:UIControlStateNormal];
        UIImage *chatImage = [UIImage imageNamed:@"chat_send_nor"];
        [self.chatButton setBackgroundImage:[chatImage stretchableImageWithLeftCapWidth:chatImage.size.width*0.5 topCapHeight:chatImage.size.height*0.5] forState:(UIControlStateNormal)];
        [self layoutIfNeeded];
        [self.chatButton mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat labelH = self.chatButton.titleLabel.frame.size.height+30;
            CGFloat labelW = self.chatButton.titleLabel.frame.size.width+40;
            make.height.mas_equalTo(labelH);
            make.width.mas_equalTo(labelW);
        }];
        //强制更新
        [self layoutIfNeeded];
        //计算出高度
        //文字的最大Y值
        CGFloat labelMaxY = CGRectGetMaxY(self.chatButton.frame);
        //图片最大Y值
        CGFloat imageMaxY = CGRectGetMaxY(self.iconImage.frame);
        message.cellHeight = MAX(labelMaxY, imageMaxY)+10;
    }else{
        self.chatButton.hidden = YES;
        self.iconImage.hidden = YES;
        self.otherImage.hidden = NO;
        self.otherChatButton.hidden = NO;
        [self.otherChatButton setTitle:message.text forState:UIControlStateNormal];
        UIImage *chatImage = [UIImage imageNamed:@"chat_recive_nor"];
        [self.otherChatButton setBackgroundImage:[chatImage stretchableImageWithLeftCapWidth:chatImage.size.width*0.5 topCapHeight:chatImage.size.height*0.5] forState:(UIControlStateNormal)];
        [self layoutIfNeeded];
        [self.otherChatButton mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat labelH = self.otherChatButton.titleLabel.frame.size.height+30;
            CGFloat labelW = self.otherChatButton.titleLabel.frame.size.width+40;
            make.height.mas_equalTo(labelH);
            make.width.mas_equalTo(labelW);
        }];
        //强制更新
        [self layoutIfNeeded];
        //计算出高度
        //文字的最大Y值
        CGFloat labelMaxY = CGRectGetMaxY(self.otherChatButton.frame);
        //图片最大Y值
        CGFloat imageMaxY = CGRectGetMaxY(self.iconImage.frame);
        message.cellHeight = MAX(labelMaxY, imageMaxY)+10;
    }
    
    
}


@end
