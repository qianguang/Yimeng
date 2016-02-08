//
//  Utility.h
//  QJ
//
//  Created by Qianchuang on 14-7-8.
//  Copyright (c) 2014年 QianChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *公用方法
 */
@interface Utility : NSObject
/**
 *显示提示字符
 */
+ (void)popWithString:(NSString *)string onView:(UIView *)view;
/**
 *修改视图层
 */
+ (void)setRoundRectWithView:(UIView *)view andCorner:(float)corner;
/**
 *创建返回按钮
 */
+ (UIButton *)createBackButton;
/**
 *判断密码是否符合规则
 */
+(BOOL)validPassword:(NSString*)password;
/**
 *判断护照等是否符合规则
 */
+ (BOOL)validCardNumber:(NSString*)number;
/**
 *判断编号是否符合规则
 */
+ (BOOL)validNumber:(NSString*)number;
/**
 *判断银行卡号是否符合规则
 */
+ (BOOL)validBankCardNumber:(NSString*)number;
/**
 *邮箱验证
 */
+ (BOOL) validateEmail:(NSString *)email;
/**
 *手机号码验证
 */
+ (BOOL) validateMobile:(NSString *)mobile;
/**
 *身份证号验证
 */
+ (BOOL)validateIdentityCard: (NSString *)identityCard;
/**
 *PV验证
 */
+ (BOOL)validatePV:(NSString *)pvString;
@end
