//
//  NELanguageManager.m
//  SwiftCam
//
//  Created by billylee on 17/4/2015.
//  Copyright (c) 2015年 com.NEIL. All rights reserved.
//

#import "NELanguageManager.h"

#define NELanguageManager_preset_language @"NELanguageManager_preset_language"

@interface NELanguageManager()

@property (nonatomic, strong) NSBundle *mainBundle;
@property (nonatomic, strong) NSBundle *localeBundle;

@property (nonatomic, assign) NELanguageType languageType;

@end

@implementation NELanguageManager


+ (NELanguageManager*)sharedManager {
    static NELanguageManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[NELanguageManager alloc] init];
    });
    
    return _manager;
}

- (void)setMainBundle:(NSBundle*)mainBundle {
    _mainBundle = mainBundle;
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *presetLanguage = [userDefault objectForKey:NELanguageManager_preset_language];
    NSString *language = presetLanguage.length > 0 ? presetLanguage : [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *path = [self.mainBundle pathForResource:language ofType:@"lproj"];
    if (path) {
        self.localeBundle = [NSBundle bundleWithPath:path];
    } else {
        self.localeBundle = [NSBundle bundleWithPath:[self.mainBundle pathForResource:@"en" ofType:@"lproj"] ];
    }
    
    if ([language isEqualToString:@"en"]) {
        self.languageType = NELanguageTypeEnglish;
    } else if([language isEqualToString:@"zh-Hant"]) {
        self.languageType = NELanguageTypeChinese;
    } else if([language isEqualToString:@"ja"]) {
        self.languageType = NELanguageTypeJapanese;
    }
}

- (void)changeLanguage:(NELanguageType)language {
    NSAssert(self.mainBundle, @"Please call [setMainBundle] first!!");
    
    NSString *string = @"en";
    switch (language) {
        default:
        case NELanguageTypeEnglish:
            self.languageType = NELanguageTypeEnglish;
            string = @"en";
            break;
        case NELanguageTypeJapanese:
            self.languageType = NELanguageTypeJapanese;
            string = @"ja";
            break;
        case NELanguageTypeChinese:
            self.languageType = NELanguageTypeChinese;
            string = @"zh-Hant";
            break;
    }
    
    NSString *path = [self.mainBundle pathForResource:string ofType:@"lproj"];
    if (path) {
        self.localeBundle = [NSBundle bundleWithPath:path];
    }
    [[NSUserDefaults standardUserDefaults] setObject:string forKey:NELanguageManager_preset_language];
    [[NSNotificationCenter defaultCenter] postNotificationName:NELanguageManager_Language_change object:nil];
}

- (NELanguageType)getCurrentLanguage {
    NSAssert(self.mainBundle, @"Please call [setMainBundle] first!!");
    
    return self.languageType;
}

- (NSString*)getLocalizedString:(NSString*)key {
    NSAssert(self.mainBundle, @"Please call [setMainBundle] first!!");
    
    if (self.localeBundle == nil) return key;
    
    NSString *string = [self.localeBundle localizedStringForKey:key value:key table:nil];
    
    return string.length > 0 ? string : key;
}

@end
