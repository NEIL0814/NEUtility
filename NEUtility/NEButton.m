//
//  NEButton.m
//  Dvp
//
//  Created by NEIL on 18/5/15.
//  Copyright (c) 2015 NEIL. All rights reserved.
//

#import "NEButton.h"

#define kTextTopPadding 4.0f

@implementation NEButton

- (void)awakeFromNib {
    [super awakeFromNib];
    if (self.cornerRadius > 0) {
        self.layer.cornerRadius = self.cornerRadius;
        self.layer.masksToBounds = YES;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.verticalAlignTextAndImage) {
        CGRect titleLabelFrame = self.titleLabel.frame;
        
        CGSize labelSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        
        CGRect imageFrame = self.imageView.frame;
        
        CGSize fitBoxSize = (CGSize){.height = labelSize.height + kTextTopPadding +  imageFrame.size.height, .width = MAX(imageFrame.size.width, labelSize.width)};
        
        CGRect fitBoxRect = CGRectInset(self.bounds, (self.bounds.size.width - fitBoxSize.width)/2, (self.bounds.size.height - fitBoxSize.height)/2);
        
        imageFrame.origin.y = fitBoxRect.origin.y;
        imageFrame.origin.x = CGRectGetMidX(fitBoxRect) - (imageFrame.size.width/2);
        self.imageView.frame = imageFrame;
        
        titleLabelFrame.size.width = labelSize.width;
        titleLabelFrame.size.height = labelSize.height;
        titleLabelFrame.origin.x = (self.frame.size.width / 2) - (labelSize.width / 2);
        titleLabelFrame.origin.y = fitBoxRect.origin.y + imageFrame.size.height + kTextTopPadding;
        self.titleLabel.frame = titleLabelFrame;
    }
}

@end
