//
//  xzzTableViewCell.h
//  TB优化新版(辛小二)
//
//  Created by 辛忠志 on 2017/9/11.
//  Copyright © 2017年 TB优化新版(辛小二). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xzzModel.h"
@interface xzzTableViewCell : UITableViewCell
@property (nonatomic, strong) xzzModel *entity;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/*不利用sizeThatFits的方式计算高度 采用自己计算*/
-(CGFloat)height;
@end
