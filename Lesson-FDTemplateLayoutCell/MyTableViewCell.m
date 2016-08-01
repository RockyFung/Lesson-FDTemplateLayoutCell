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
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 40)];
    self.titleLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.titleLabel];
    
    self.contextLabel = [[UILabel alloc]init];
    self.contextLabel.numberOfLines = 0;
    [self.contentView addSubview:self.contextLabel];
    [self.contextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.offset(10);
        make.right.offset(-10);
        make.bottom.offset (-10);
    }];
}


- (void)setModel:(MyModel *)model{
    _model = model;
    self.titleLabel.text = model.cellTitle;
    self.contextLabel.text = model.cellContext;
}

// If you are not using auto layout, override this method, enable it by setting
// "fd_enforceFrameLayout" to YES.
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.titleLabel sizeThatFits:size].height;
    totalHeight += [self.contextLabel sizeThatFits:size].height;
    totalHeight += 100; // margins
    return CGSizeMake(size.width, totalHeight);
}










@end
