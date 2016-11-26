//
//  NELanguageManager.h
//  SwiftCam
//
//  Created by billylee on 17/4/2015.
//  Copyright (c) 2015年 com.NEIL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    NELanguageTypeEnglish,
    NELanguageTypeChinese,
    NELanguageTypeJapanese,
} NELanguageType;

static NSString *NELanguageManager_Language_change = @"NELanguageManager_Language_change";

@interface NELanguageManager : NSObject

+ (NELanguageManager*)sharedManager;

- (void)setMainBundle:(NSBundle*)mainBundle;

- (void)changeLanguage:(NELanguageType)language;

- (NELanguageType)getCurrentLanguage;

- (NSString*)getLocalizedString:(NSString*)key;

@end
