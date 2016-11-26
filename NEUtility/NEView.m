//
//  NEView.m
//  Dvp
//
//  Created by NEIL on 18/5/15.
//  Copyright (c) 2015 NEIL. All rights reserved.
//

#import "NEView.h"

@implementation NEView

- (void)awakeFromNib {
    [super awakeFromNib];
    if (self.isFullCircle) {
        self.layer.cornerRadius = self.frame.size.width / 2.0f;
        self.layer.masksToBounds = YES;
    }
    if (self.cornerRadius > 0) {
        self.layer.cornerRadius = self.cornerRadius;
        self.layer.masksToBounds = YES;
    }
}

@end
