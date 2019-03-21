//
//  DemoInfoCell.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/21.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "DemoInfoCell.h"

@interface DemoInfoCell ()

@end

@implementation DemoInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Private Method
- (void)setup {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subTitleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel).mas_offset(5.f);
        make.left.equalTo(self.contentView).mas_offset(15.f);
        make.right.equalTo(self.contentView);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.right.equalTo(self.titleLabel);
        make.bottom.equalTo(self.contentView).mas_offset(-5.f);
    }];
}

#pragma mark - Getters
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] generateLabelWithFont:[UIFont systemFontOfSize:14.f]
                                                   textColor:[UIColor blackColor]
                                                   textAlign:NSTextAlignmentLeft];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] generateLabelWithFont:[UIFont systemFontOfSize:10.f]
                                                 textColor:[UIColor blackColor]
                                                 textAlign:NSTextAlignmentLeft];
        _subTitleLabel.numberOfLines = 0;
    }
    return _subTitleLabel;
}
@end
