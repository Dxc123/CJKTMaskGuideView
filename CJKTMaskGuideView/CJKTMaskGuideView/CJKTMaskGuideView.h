//
//  CYPromptCoverView.h
//  CYPromptCoverTest
//
//  Created by Dxc_iOS on 2018/9/29.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BOOLFIRST @"FirstEnterInto"
@class CJKTMaskGuideView;

/**
 镂空部位的类型
 */
typedef NS_ENUM(NSUInteger, CJKTMaskGuideViewRevealType) {
    CJKTMaskGuideViewRevealTypeRect = 0,    //矩形  default
    CJKTMaskGuideViewRevealTypeOval         //椭圆
};

/**
 遮罩的类型
 */
typedef NS_ENUM(NSUInteger, CJKTMaskGuideViewCoverType) {
    CJKTMaskGuideViewCoverTypeColored,      //颜色      default
    CJKTMaskGuideViewCoverTypeBlurred       //模糊
};


typedef NS_ENUM(NSUInteger, CJKTMaskGuideViewLayoutType) {
    CJKTMaskGuideViewLayoutTypeUP,          //描述label所处的位置
    CJKTMaskGuideViewLayoutTypeLeftUP,
    CJKTMaskGuideViewLayoutTypeLeft,
    CJKTMaskGuideViewLayoutTypeLeftDown,
    CJKTMaskGuideViewLayoutTypeDown,
    CJKTMaskGuideViewLayoutTypeRightDown,
    CJKTMaskGuideViewLayoutTypeRight,
    CJKTMaskGuideViewLayoutTypeRightUP,
    
};



@protocol CJKTMaskGuideViewDelegate <NSObject>

@optional
- (void)didClickedDismissBtn:(CJKTMaskGuideView *)coverView;
- (void)didClickedNeverBtn:(CJKTMaskGuideView *)coverView;
@end


@interface CJKTMaskGuideView : UIView

@property (nonatomic,weak) id<CJKTMaskGuideViewDelegate> delegate;

@property (nonatomic,assign) CJKTMaskGuideViewCoverType coverType;// 遮罩的类型
@property (nonatomic,assign) CJKTMaskGuideViewRevealType revealType;// 镂空部位的类型

@property (nonatomic,assign,getter=isDesHidden) BOOL desHidden;//是否隐藏

//遮罩模糊半径
//is essential to bluredCoverType  0 — 1  default is 0.5
@property(nonatomic,assign) CGFloat blurRadius;
//镂空部位
//is essential to coloredCoverType  default is 0 0 0 0.8
@property (nonatomic,strong) UIColor *coverColor;
//white
@property (nonatomic,strong,readonly) UIColor* tintColor;

//default is 0.2
@property (nonatomic,assign) CGFloat showDuration;
//default is 0.2
@property (nonatomic,assign) CGFloat dismissDuration;

//x轴外扩的值   default is -5
@property(nonatomic,assign) CGFloat insetX;
//Y轴外扩的值   default is -5
@property(nonatomic,assign) CGFloat insetY;


@property (nonatomic,assign,readonly) CGRect revealFrame;//镂空部分的Frame

@property (nonatomic,assign) CJKTMaskGuideViewLayoutType layoutType;//描述label所处的位置类型
@property (nonatomic,assign) CGPoint neverBtnCenter;

//default is 确定
@property (nonatomic,copy) NSString* dismissBtnTitle;//确定或者下一步按钮标题
@property (nonatomic,copy) NSString* des;//描述的标题
@property (nonatomic,copy) NSString* detailDes;//详情描述



/**
 初始化
 */
- (instancetype)initWithRevalView:(UIView *)revalView layoutType:(CJKTMaskGuideViewLayoutType)layoutType;
/**
 带背景色初始化
 */
- (instancetype)initWithBgColor:(UIColor *)bgColor revealView:(UIView *)revealView revealType:(CJKTMaskGuideViewRevealType)type layoutType:(CJKTMaskGuideViewLayoutType)layoutType;
/**
 带模糊背景的初始化
 */
- (instancetype)initWithBlurRadius:(CGFloat)blurRadius revealView:(UIView *)revealView revealType:(CJKTMaskGuideViewRevealType)type layoutType:(CJKTMaskGuideViewLayoutType)layoutType;

/**
 显示方法
 */
- (void)showInView:(UIView *)view;
/**
 隐藏方法
 */
- (void)dismiss;
@end
