//
//  CJKTMaskGuideViewQueue.h
//  CJKTMaskGuideView
//
//  Created by Dxc_iOS on 2018/9/29.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CJKTMaskGuideView;
@class CJKTMaskGuideViewQueue;

@protocol CJKTMaskGuideViewQueueDelegate <NSObject>

@optional
- (void)CJKTMaskGuideViewQueue:(CJKTMaskGuideViewQueue *)queue didDismissCoverAtIndex:(NSUInteger)index;
- (void)CJKTMaskGuideViewQueueDidDismissAllCovers:(CJKTMaskGuideViewQueue *)queue;
- (void)CJKTMaskGuideViewQueue:(CJKTMaskGuideViewQueue *)queue didClickedNeverBtnInCoverView:(CJKTMaskGuideView *)coverView;
@end


@interface CJKTMaskGuideViewQueue : NSObject

@property (nonatomic,weak) id<CJKTMaskGuideViewQueueDelegate>delegate;

@property (readonly, strong) NSMutableArray<__kindof CJKTMaskGuideView *> *covers;

@property (readonly,strong) CJKTMaskGuideView* showingCover;

/**
CoverView 添加到蒙版队列里
 */
- (void)addCoverView:(CJKTMaskGuideView *)aCover;

/**
 蒙版队列显示方法
 */
- (void)showCoversInView:(UIView *)aView;
/**
 蒙版队列隐藏方法
 */

- (void)dismissAllCovers;
@end
