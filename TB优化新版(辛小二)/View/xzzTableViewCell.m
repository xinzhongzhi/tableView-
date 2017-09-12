//
//  xzzTableViewCell.m
//  TB优化新版(辛小二)
//
//  Created by 辛忠志 on 2017/9/11.
//  Copyright © 2017年 TB优化新版(辛小二). All rights reserved.
//
#pragma mark -- UIColor宏定义
#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]
#import "xzzTableViewCell.h"
#import <Masonry.h>
@interface xzzTableViewCell()





@end
@implementation xzzTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setEntity:(xzzModel *)entity
{
    _entity = entity;
    self.titleLabel.text = entity.title;
    self.contentLabel.text = entity.content;
    self.contentImageView.image = entity.imageName.length > 0 ? [UIImage imageNamed:entity.imageName] : nil;
    self.usernameLabel.text = entity.username;
    self.timeLabel.text = entity.time;
}
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    
    totalHeight += [self.titleLabel sizeThatFits:size].height;
    totalHeight += [self.contentLabel sizeThatFits:size].height;
    totalHeight += [self.contentImageView sizeThatFits:size].height;
    totalHeight += [self.usernameLabel sizeThatFits:size].height;
    totalHeight += 40; // margins
    NSLog(@"%f",totalHeight);
    return CGSizeMake(size.width, totalHeight);
}

/*
    自定义方法
 */
-(CGFloat)height{
    /*默认为40的高度*/
    CGFloat totalHeight = 40;
    
    
    /*计算titleLabel的高度*/
    CGSize titleLabelSize=[self.titleLabel.text boundingRectWithSize:CGSizeMake(250, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:nil].size;
    /*计算contentLabel的高度*/
    CGSize contentLabelSize=[self.contentLabel.text boundingRectWithSize:CGSizeMake(250, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} context:nil].size;
    /*计算contentImageView的高度*/
    CGSize contentImageViewSize= self.contentImageView.frame.size;
    /*计算usernameLabel的高度*/
    CGSize usernameLabelSize=[self.usernameLabel.text boundingRectWithSize:CGSizeMake(250, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11]} context:nil].size;
    /*计算timeLabel的高度*/
    CGSize timeLabelSize=[self.timeLabel.text boundingRectWithSize:CGSizeMake(250, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]} context:nil].size;
    
    
    totalHeight = totalHeight+titleLabelSize.height+contentLabelSize.height+contentImageViewSize.height+usernameLabelSize.height+timeLabelSize.height;

    return totalHeight;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
