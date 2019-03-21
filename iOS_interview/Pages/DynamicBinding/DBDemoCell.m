//
//  DBDemoCell.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/19.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "DBDemoCell.h"

@implementation DBDemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupSubUI];
        [self layoutSubUI];
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
- (void)setupSubUI {
    [self.contentView addSubview:self.infoLabel];
    [self.contentView addSubview:self.deleteBtn];
}

- (void)layoutSubUI {
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).mas_offset(10.f);
        make.left.equalTo(self.contentView).mas_offset(10.f);
        make.bottom.equalTo(self.contentView).mas_offset(-10.f);
        make.right.equalTo(self.deleteBtn.mas_left).mas_offset(10.f);
    }];
    
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30.f, 30.f));
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).mas_offset(-10.f);
    }];
}

#pragma mark - Getters
- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
        _infoLabel.font = [UIFont systemFontOfSize:14.f];
        _infoLabel.textColor = [UIColor blackColor];
        _infoLabel.textAlignment = NSTextAlignmentLeft;
        _infoLabel.numberOfLines = 0;
    }
    return _infoLabel;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc] init];
        [_deleteBtn setImage:[UIImage imageNamed:@"icon_delete"] forState:UIControlStateNormal];
    }
    return _deleteBtn;
}
@end
