//
//  MyTableViewCell.m
//  Lesson-FDTemplateLayoutCell
//
//  Created by rocky on 16/7/29.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contextLabel;

@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.bounds = [UIScreen mainScreen].bounds;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.titleLabel];
    
    self.contextLabel = [[UILabel alloc]init];
    self.contextLabel.backgroundColor = [UIColor cyanColor];
    self.contextLabel.numberOfLines = 0;
    [self.contentView addSubview:self.contextLabel];
    
    
    // 标题
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView).offset(5);
        make.height.mas_equalTo(30);
    }];
    
    // 内容
    [self.contextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.offset(5);
        make.right.offset(-5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);
    }];
}


- (void)setModel:(MyModel *)model{
    _model = model;
    self.titleLabel.text = model.cellTitle;
    self.contextLabel.text = model.cellContext;
}

// 如果不使用自动布局，请重写此方法，通过设置启用 "fd_enforceFrameLayout" = YES.
/*
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.titleLabel sizeThatFits:size].height;
    totalHeight += [self.contextLabel sizeThatFits:size].height;
    totalHeight += 100; // margins
    return CGSizeMake(size.width, totalHeight);
}
*/









@end
