/*
 * Backpack - Skyscanner's Design System
 *
 * Copyright 2018-2019 Skyscanner Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#import "BPKNavigationBarTitleView.h"

#import <Backpack/Common.h>
#import <Backpack/Label.h>

#import "BPKNavigationBarHelpers.h"

const CGFloat BPKNavigationBarTitleHeight = 44;

NS_ASSUME_NONNULL_BEGIN

@implementation BPKNavigationBarTitleView
@synthesize titleLabel = _titleLabel;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        _showsContent = NO;
        [self setUp];
    }

    return self;
}

- (void)setTitle:(NSString *)title {
    BPKAssertMainThread();
    if (title != _title) {
        _title = [title copy];

        [self updateTitleLabelText];
    }
}

- (void)setShortTitle:(NSString *_Nullable)shortTitle {
    BPKAssertMainThread();
    if (shortTitle != _shortTitle) {
        _shortTitle = [shortTitle copy];

        [self updateTitleLabelText];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateTitleLabelText];
}

- (void)setShowsContent:(BOOL)showsContent {
    BPKAssertMainThread();

    if (_showsContent != showsContent) {
        _showsContent = showsContent;

        [UIView animateWithDuration:.15 animations:^{
            self.titleLabel.alpha = self.showsContent ? 1.0 : 0.0;
        }];
    }
}

#pragma mark - Private

- (void) updateTitleLabelText {
    if (self.shortTitle == nil) {
        self.titleLabel.text = self.title;
        return;
    }

    if ([BPKNavigationBarHelpers view:self canFitTitle:self.title]) {
        self.titleLabel.text = self.title;
    } else {
        self.titleLabel.text = self.shortTitle;
    }
}

- (BPKLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[BPKLabel alloc] initWithFontStyle:BPKFontStyleTextBaseEmphasized];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.accessibilityTraits = UIAccessibilityTraitHeader;
    }

    return _titleLabel;
}

- (void)setUp {
    _showsContent = NO;
    [self addSubview:self.titleLabel];

    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.titleLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.4],
    ]];
    _titleLabel.alpha = 0.0;
}

@end

NS_ASSUME_NONNULL_END
