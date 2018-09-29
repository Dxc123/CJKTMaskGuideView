//
//  CJKTMaskGuideViewQueue.m
//  CJKTMaskGuideView
//
//  Created by Dxc_iOS on 2018/9/29.
//  Copyright © 2018 超级课堂. All rights reserved.
//

#import "CJKTMaskGuideViewQueue.h"
#import "CJKTMaskGuideView.h"

@interface CJKTMaskGuideViewQueue()<CJKTMaskGuideViewDelegate>
@property (nonatomic,weak) UIView* foundationView;
@end

//设置这个全局变量是对queue进行引用，防止queue创建后自己销毁
id instance = nil;

@implementation CJKTMaskGuideViewQueue


#pragma mark - init
- (instancetype)init {
    if (self = [super init]) {
        instance = self;
    }
    return self;
}

#pragma mark - public
- (void)addCoverView:(CJKTMaskGuideView *)aCover {
    NSAssert(aCover, @"inset nil object to coverQueue");
    NSAssert([aCover isKindOfClass:[CJKTMaskGuideView class]], @"inset no-promptCoverView to coverQueue");
    
    if (_covers == nil) {
        _covers = [NSMutableArray array];
    }
    [_covers addObject:aCover];
    aCover.delegate = self;
}

- (void)showCoversInView:(UIView *)aView {
    NSAssert(aView, @"foundationView is nil");
    self.foundationView = aView;
    [self showCoverAtIndex:0];
}


- (void)dismissAllCovers {
    [_covers removeAllObjects];
    if (_showingCover) {
        [_showingCover dismiss];
    }
    instance = nil;
}

#pragma mark - pravite
- (void)showCoverAtIndex:(NSUInteger)index {
    CJKTMaskGuideView *cover = _covers[index];
    
    if (index == 0) {
        cover.dismissDuration = 0;
        cover.dismissBtnTitle = @"下一步";
    } else if (index == (_covers.count - 1)) {
        cover.showDuration = 0;
        cover.dismissBtnTitle = @"完成";
    } else {
        cover.showDuration = 0;
        cover.dismissDuration = 0;
        cover.dismissBtnTitle = @"下一步";
    }
    [cover showInView:self.foundationView];
    _showingCover = cover;
}

#pragma mark - coverDelegate
- (void)didClickedDismissBtn:(CJKTMaskGuideView *)coverView {
    
    NSUInteger index = [_covers indexOfObject:coverView];
    _showingCover = nil;
    
    if (index == _covers.count - 1) {
        [self dismissAllCovers];
        if (self.delegate && [self.delegate respondsToSelector:@selector(CJKTMaskGuideViewQueueDidDismissAllCovers:)]) {
            [self.delegate CJKTMaskGuideViewQueueDidDismissAllCovers:self];
        }
        return;
    }

    if (self.delegate && [self.delegate respondsToSelector:@selector(CJKTMaskGuideViewQueue:didDismissCoverAtIndex:)]) {
        [self.delegate CJKTMaskGuideViewQueue:self didDismissCoverAtIndex:index];
    }
    
    NSUInteger nextIndex = index + 1;
    
    [self showCoverAtIndex:nextIndex];
}

- (void)didClickedNeverBtn:(CJKTMaskGuideView *)coverView {
    
    [self dismissAllCovers];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(CJKTMaskGuideViewQueue:didClickedNeverBtnInCoverView:)]) {
        [self.delegate CJKTMaskGuideViewQueue:self didClickedNeverBtnInCoverView:coverView];
    }
}
@end
