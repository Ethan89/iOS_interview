//
//  CustomObjectCopyViewController.m
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/19.
//  Copyright © 2019 ethan. All rights reserved.
//

#import "CustomObjectCopyViewController.h"
#import "Student.h"

typedef NS_ENUM(NSInteger, EditType) {
    // enum like: MyEnumTypeA = 0,
    EditTypeUnknow = 0,
    EditTypeName,
    EditTypeAge
};

@interface CustomObjectCopyViewController ()

@property (nonatomic, strong) Student *sourceStudent;
@property (nonatomic, strong) Student *studentCopy;

@property (nonatomic, strong) UIView *sourceContainer;
@property (nonatomic, strong) UILabel *sourcePtrLabel;
@property (nonatomic, strong) UILabel *sourcePtrValueLabel;
@property (nonatomic, strong) UILabel *sourceNameLabel;
@property (nonatomic, strong) UILabel *sourceNameValueLabel;
@property (nonatomic, strong) UILabel *sourceAgeLabel;
@property (nonatomic, strong) UILabel *sourceAgeValueLabel;

@property (nonatomic, strong) UIView *line1;

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIButton *deepCopyBtn;

@property (nonatomic, strong) UIView *line2;

@property (nonatomic, strong) UIView *objNewContainer;
@property (nonatomic, strong) UILabel *objNewPtrLabel;
@property (nonatomic, strong) UILabel *objNewPtrValueLabel;
@property (nonatomic, strong) UILabel *objNewNameLabel;
@property (nonatomic, strong) UILabel *objNewNameValueLabel;
@property (nonatomic, strong) UILabel *objNewAgeLabel;
@property (nonatomic, strong) UILabel *objNewAgeValueLabel;

@property (nonatomic, strong) UIView *line3;

@property (nonatomic, strong) UIView *editContainer;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *ageTextField;

@end

@implementation CustomObjectCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
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
    
    [self.containerView addSubview:self.sourceContainer];
    
    NSArray *sourceLabels = @[self.sourcePtrLabel, self.sourcePtrValueLabel,
                              self.sourceNameLabel, self.sourceNameValueLabel,
                              self.sourceAgeLabel, self.sourceAgeValueLabel];
    for (NSInteger i = 0; i < sourceLabels.count; i++) {
        [self.sourceContainer addSubview:sourceLabels[i]];
    }
    
    [self.containerView addSubview:self.line1];
    
    [self.containerView addSubview:self.btn];
    [self.containerView addSubview:self.deepCopyBtn];
    
    [self.containerView addSubview:self.line2];
    
    [self.containerView addSubview:self.objNewContainer];
    
    NSArray *objNewLabels = @[self.objNewPtrLabel, self.objNewPtrValueLabel,
                              self.objNewNameLabel, self.objNewNameValueLabel,
                              self.objNewAgeLabel, self.objNewAgeValueLabel];
    for (NSInteger i = 0; i < objNewLabels.count; i++) {
        [self.objNewContainer addSubview:objNewLabels[i]];
    }
    
    [self.containerView addSubview:self.line3];
    
    [self.containerView addSubview:self.editContainer];
    [self.editContainer addSubview:self.nameTextField];
    [self.editContainer addSubview:self.ageTextField];
}

- (void)layoutSubUI {
    [super layoutSubUI];
    
    [self.sourceContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.containerView);
    }];
    
    NSArray *sourceLabels = @[self.sourcePtrLabel, self.sourcePtrValueLabel,
                              self.sourceNameLabel, self.sourceNameValueLabel,
                              self.sourceAgeLabel, self.sourceAgeValueLabel];
    
    for (NSInteger i = 0; i < sourceLabels.count; i++) {
        UILabel *target = sourceLabels[i];
        [target mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.sourceContainer).mas_offset(i * 25.f);
            make.left.equalTo(self.sourceContainer).mas_offset(5.f);
            make.right.equalTo(self.sourceContainer).mas_offset(-5.f);
            make.height.mas_equalTo(25.f);
            if (i == sourceLabels.count - 1) {
                make.bottom.mas_equalTo(self.sourceContainer.mas_bottom);
            }
        }];
    }
    
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sourceContainer.mas_bottom);
        make.left.right.equalTo(self.containerView);
        make.height.mas_equalTo(.5f);
    }];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line1.mas_bottom).mas_offset(5.f);
        make.size.mas_equalTo(CGSizeMake(100.f, 25.f));
        make.centerX.equalTo(self.sourceContainer).mas_offset(-60.f);
    }];
    
    [self.deepCopyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100.f, 25.f));
        make.centerY.equalTo(self.btn);
        make.centerX.equalTo(self.sourceContainer).mas_offset(60.f);
    }];
    
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn.mas_bottom).mas_offset(5.f);
        make.left.right.equalTo(self.containerView);
        make.height.mas_equalTo(.5f);
    }];
    
    [self.objNewContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line2.mas_bottom).mas_offset(5.f);
        make.left.right.equalTo(self.containerView);
    }];
    
    NSArray *objNewLabels = @[self.objNewPtrLabel, self.objNewPtrValueLabel,
                              self.objNewNameLabel, self.objNewNameValueLabel,
                              self.objNewAgeLabel, self.objNewAgeValueLabel];
    
    for (NSInteger i = 0; i < objNewLabels.count; i++) {
        UILabel *target = objNewLabels[i];
        [target mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.objNewContainer).mas_offset(i * 25.f);
            make.left.equalTo(self.objNewContainer).mas_offset(5.f);
            make.right.equalTo(self.objNewContainer).mas_offset(-5.f);
            make.height.mas_equalTo(25.f);
            if (i == sourceLabels.count - 1) {
                make.bottom.mas_equalTo(self.objNewContainer.mas_bottom);
            }
        }];
    }
    
    [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.objNewContainer.mas_bottom);
        make.left.right.equalTo(self.containerView);
        make.height.mas_equalTo(.5f);
    }];
    
    [self.editContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line3.mas_bottom);
        make.left.right.equalTo(self.containerView);
    }];
    
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.editContainer);
        make.left.equalTo(self.editContainer).mas_offset(5.f);
        make.right.equalTo(self.editContainer).mas_offset(-5.f);
        make.height.mas_equalTo(44.f);
    }];
    
    [self.ageTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameTextField.mas_bottom);
        make.left.right.equalTo(self.nameTextField);
        make.height.mas_equalTo(44.f);
        make.bottom.mas_equalTo(self.editContainer);
    }];
}

- (void)initData {
    self.sourcePtrValueLabel.text  = [NSString stringWithFormat:@"%p", self.sourceStudent];
    self.sourceNameValueLabel.text = [NSString stringWithFormat:@"%p - %@",
                                      self.sourceStudent.name, self.sourceStudent.name];
    self.sourceAgeValueLabel.text  = [NSString stringWithFormat:@"%ld",self.sourceStudent.age];
    
}

#pragma mark - Private Method
- (UILabel *)generateLabel {
    UILabel *new = [[UILabel alloc] init];
    new.font = [UIFont systemFontOfSize:14.f];
    new.textColor = [UIColor blackColor];
    new.textAlignment = NSTextAlignmentLeft;
    
    return new;
}

- (UIButton *)generateBaseButton {
    UIButton *tmpBtn = [[UIButton alloc] init];
    tmpBtn.layer.cornerRadius = 4.f;
    tmpBtn.backgroundColor = kMainColor;
    tmpBtn.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [tmpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    return tmpBtn;
}

- (UITextField *)generateTextField {
    UITextField *new = [[UITextField alloc] init];
    new.font = [UIFont systemFontOfSize:14.f];
    new.textColor = [UIColor blackColor];
    
    return new;
}

- (void)cleanNewObjInfo {
    self.objNewPtrValueLabel.text  = @"";
    self.objNewNameValueLabel.text = @"";
    self.objNewAgeValueLabel.text  = @"";
    self.studentCopy = nil;
}

- (void)btnAction {
    [self cleanTextField];
    [self cleanNewObjInfo];
    
    self.studentCopy = [self.sourceStudent copy];
    [self updateNewObjInfo];
}

- (void)deepCopyBtnAction {
    [self cleanTextField];
    [self cleanNewObjInfo];
    
    self.studentCopy = [self.sourceStudent mutableCopy];
    [self updateNewObjInfo];
}

- (void)updateNewObjInfo {
    self.objNewPtrValueLabel.text  = [NSString stringWithFormat:@"%p", self.studentCopy];
    self.objNewNameValueLabel.text = [NSString stringWithFormat:@"%p - %@",
                                      self.studentCopy.name, self.studentCopy.name];
    self.objNewAgeValueLabel.text  = [NSString stringWithFormat:@"%ld",
                                      self.studentCopy.age];
}

- (void)cleanTextField {
    self.nameTextField.text = @"";
    self.ageTextField.text = @"";
}

- (void)textFieldContentChanged:(id)sender {
    UITextField *target = nil;
    if ([sender isKindOfClass:[UITextField class]]) {
        target = (UITextField *)sender;
    }
    
    if (target == nil || self.studentCopy == nil) {
        return;
    }
    
    EditType currType = target.tag;
    
    if (currType == EditTypeName) {
        self.studentCopy.name = target.text;
    } else if (currType == EditTypeAge){
        self.studentCopy.age = [target.text integerValue];
    }
    
    [self updateNewObjInfo];
}

#pragma mark - Getters
- (Student *)sourceStudent {
    if (!_sourceStudent) {
        _sourceStudent = [[Student alloc] init];
        _sourceStudent.name = @"李雷";
        _sourceStudent.age = 20;
    }
    return _sourceStudent;
}

- (Student *)studentCopy {
    if (!_studentCopy) {
        _studentCopy = [[Student alloc] init];
    }
    return _studentCopy;
}

- (UIView *)sourceContainer {
    if (!_sourceContainer) {
        _sourceContainer = [[UIView alloc] init];
    }
    return _sourceContainer;
}

- (UILabel *)sourcePtrLabel {
    if (!_sourcePtrLabel) {
        _sourcePtrLabel = [self generateLabel];
        _sourcePtrLabel.text = @"原对象指针地址:";
    }
    return _sourcePtrLabel;
}

- (UILabel *)sourcePtrValueLabel {
    if (!_sourcePtrValueLabel) {
        _sourcePtrValueLabel = [self generateLabel];
    }
    return _sourcePtrValueLabel;
}

- (UILabel *)sourceNameLabel {
    if (!_sourceNameLabel) {
        _sourceNameLabel = [self generateLabel];
        _sourceNameLabel.text = @"源对象name:";
    }
    return _sourceNameLabel;
}

- (UILabel *)sourceNameValueLabel {
    if (!_sourceNameValueLabel) {
        _sourceNameValueLabel = [self generateLabel];
    }
    return _sourceNameValueLabel;
}

- (UILabel *)sourceAgeLabel {
    if (!_sourceAgeLabel) {
        _sourceAgeLabel = [self generateLabel];
        _sourceAgeLabel.text = @"源对象age:";
    }
    return _sourceAgeLabel;
}

- (UILabel *)sourceAgeValueLabel {
    if (!_sourceAgeValueLabel) {
        _sourceAgeValueLabel = [self generateLabel];
    }
    return _sourceAgeValueLabel;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [self generateBaseButton];
        [_btn setTitle:@"Copy" forState:UIControlStateNormal];
        [_btn addTarget:self
                 action:@selector(btnAction)
       forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (UIButton *)deepCopyBtn {
    if (!_deepCopyBtn) {
        _deepCopyBtn = [self generateBaseButton];
        [_deepCopyBtn setTitle:@"Mutable Copy" forState:UIControlStateNormal];
        [_deepCopyBtn addTarget:self
                         action:@selector(deepCopyBtnAction)
               forControlEvents:UIControlEventTouchUpInside];
    }
    return _deepCopyBtn;
}

- (UIView *)objNewContainer {
    if (!_objNewContainer) {
        _objNewContainer = [[UIView alloc] init];
    }
    return _objNewContainer;
}

- (UILabel *)objNewPtrLabel {
    if (!_objNewPtrLabel) {
        _objNewPtrLabel = [self generateLabel];
        _objNewPtrLabel.text = @"新对象指针地址:";
    }
    return _objNewPtrLabel;
}

- (UILabel *)objNewPtrValueLabel {
    if (!_objNewPtrValueLabel) {
        _objNewPtrValueLabel = [self generateLabel];
    }
    return _objNewPtrValueLabel;
}

- (UILabel *)objNewNameLabel {
    if (!_objNewNameLabel) {
        _objNewNameLabel = [self generateLabel];
        _objNewNameLabel.text = @"新对象name:";
    }
    return _objNewNameLabel;
}

- (UILabel *)objNewNameValueLabel {
    if (!_objNewNameValueLabel) {
        _objNewNameValueLabel = [self generateLabel];
    }
    return _objNewNameValueLabel;
}

- (UILabel *)objNewAgeLabel {
    if (!_objNewAgeLabel) {
        _objNewAgeLabel = [self generateLabel];
        _objNewAgeLabel.text = @"新对象age:";
    }
    return _objNewAgeLabel;
}

- (UILabel *)objNewAgeValueLabel {
    if (!_objNewAgeValueLabel) {
        _objNewAgeValueLabel = [self generateLabel];
    }
    return _objNewAgeValueLabel;
}

- (UIView *)line1 {
    if (!_line1) {
        _line1 = [[UIView alloc] init];
        _line1.backgroundColor = kDivisionLineColor;
    }
    return _line1;
}

- (UIView *)line2 {
    if (!_line2) {
        _line2 = [[UIView alloc] init];
        _line2.backgroundColor = kDivisionLineColor;
    }
    return _line2;
}

- (UIView *)line3 {
    if (!_line3) {
        _line3 = [[UIView alloc] init];
        _line3.backgroundColor = kDivisionLineColor;
    }
    return _line3;
}

- (UIView *)editContainer {
    if (!_editContainer) {
        _editContainer = [[UIView alloc] init];
    }
    return _editContainer;
}

- (UITextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [self generateTextField];
        _nameTextField.placeholder = @"在此编辑name";
        _nameTextField.tag = EditTypeName;
        [_nameTextField addTarget:self
                           action:@selector(textFieldContentChanged:)
                 forControlEvents:UIControlEventEditingChanged];
    }
    return _nameTextField;
}

- (UITextField *)ageTextField {
    if (!_ageTextField) {
        _ageTextField = [self generateTextField];
        _ageTextField.placeholder = @"在此编辑age";
        _ageTextField.keyboardType = UIKeyboardTypeNumberPad;
        _ageTextField.tag = EditTypeAge;
        [_ageTextField addTarget:self
                          action:@selector(textFieldContentChanged:)
                forControlEvents:UIControlEventEditingChanged];
    }
    return _ageTextField;
}
@end
