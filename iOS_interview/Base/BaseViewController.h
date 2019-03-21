//
//  BaseViewController.h
//  iOS_interview
//
//  Created by Ethan Guo on 2019/3/18.
//  Copyright © 2019 ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, assign) BOOL hasSetupUI;
@property (nonatomic, assign) BOOL hasLayoutUI;
@property (nonatomic, assign) BOOL hasInitData;

- (void)setupSubUI;
- (void)layoutSubUI;
- (void)initData;

@end

NS_ASSUME_NONNULL_END
