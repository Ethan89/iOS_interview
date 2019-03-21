//
//  CategoryViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/20.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "CategoryViewController.h"
#import "Student+Category.h"
#import "Student+AllName.h"

@interface CategoryViewController ()

@property (nonatomic, strong) Student *student;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *allNameLabel;
@property (nonatomic, strong) UILabel *friendNameLabel;
@property (nonatomic, strong) UILabel *relationshipLabel;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupSubUI {
    [super setupSubUI];

    self.nameLabel     = [[UILabel alloc] generateLabelWithFont:[UIFont systemFontOfSize:14.f]
                                                      textColor:[UIColor blackColor]
                                                      textAlign:NSTextAlignmentLeft];
    self.ageLabel      = [[UILabel alloc] generateLabelWithFont:[UIFont systemFontOfSize:14.f]
                                                      textColor:[UIColor blackColor]
                                                      textAlign:NSTextAlignmentLeft];
    self.nickNameLabel = [[UILabel alloc] generateLabelWithFont:[UIFont systemFontOfSize:14.f]
                                                      textColor:[UIColor blackColor]
                                                      textAlign:NSTextAlignmentLeft];
    self.allNameLabel  = [[UILabel alloc] generateLabelWithFont:[UIFont systemFontOfSize:14.f]
                                                      textColor:[UIColor blackColor]
                                                      textAlign:NSTextAlignmentLeft];
    self.friendNameLabel = [[UILabel alloc] generateLabelWithFont:[UIFont systemFontOfSize:14.f]
                                                        textColor:[UIColor blackColor]
                                                        textAlign:NSTextAlignmentLeft];
    self.relationshipLabel = [[UILabel alloc] generateLabelWithFont:[UIFont systemFontOfSize:14.f]
                                                          textColor:[UIColor blackColor]
                                                          textAlign:NSTextAlignmentLeft];
}

- (void)layoutSubUI {
    [super layoutSubUI];
    
    NSArray *labels = @[self.nameLabel, self.ageLabel, self.nickNameLabel,
                        self.allNameLabel, self.friendNameLabel, self.relationshipLabel];
    
    for (NSInteger i = 0; i < labels.count; i++) {
        [self.containerView addSubview:labels[i]];
        
        [labels[i] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.containerView).mas_offset(i * 40);
            make.left.equalTo(self.containerView).mas_offset(5.f);
            make.right.equalTo(self.containerView).mas_offset(-5.f);
            make.height.mas_equalTo(40.f);
        }];
    }
}

- (void)initData {
    self.nameLabel.text = self.student.name;
    self.ageLabel.text = [NSString stringWithFormat:@"%ld", self.student.age];
    self.nickNameLabel.text = self.student.nickName;
    self.allNameLabel.text = [self.student getNameAndAge];
    self.friendNameLabel.text = self.student.friendName;
    self.relationshipLabel.text = [self.student getRelationship];
}

#pragma mark - Private Method

#pragma mark - Getters
- (Student *)student {
    if (!_student) {
        _student = [[Student alloc] init];
        _student.name = @"李雷";
        _student.age = 20;
        _student.nickName = @"小李";
        _student.friendName = @"林涛";
    }
    return _student;
}
@end
