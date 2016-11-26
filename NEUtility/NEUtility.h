//
//  NEUtility.h
//  NEUtility
//
//  Created by NEIL on 12/6/15.
//  Copyright (c) 2015 NEIL. All rights reserved.
//

#ifndef NEUtility_NEUtility_h
#define NEUtility_NEUtility_h

#import "NEView.h"
#import "NEButton.h"
#import "NEImageView.h"
#import "NELanguageManager.h"
#import "NEBaseViewController.h"
#import "Utility.h"
#import "MBProgressHUD.h"


#define NEString(key) [[NELanguageManager sharedManager] getLocalizedString:key]

#define UIColorWith256RGB(r, g, b) UIColorWith256ARGB(1.0f, r, g, b)

#define UIColorWith256ARGB(a, r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define UIColorWithRGB(r, g, b) UIColorWithARGB(1.0f, r, g, b)

#define UIColorWithARGB(a, r, g, b) [UIColor colorWithRed:r green:g blue:b alpha:a]

#ifdef DEBUG
#    define DLog(...) NSLog(__VA_ARGS__)
#else
#    define DLog(...) /* */
#endif

#endif
