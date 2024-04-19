//
//  Motif.h
//  Motif
//
//  Created by Eric Horacek on 3/29/15.
//  Copyright (c) 2015 Eric Horacek. All rights reserved.
//

@import Foundation;

//! Project version number for Motif.
FOUNDATION_EXPORT double MotifVersionNumber;

//! Project version string for Motif.
FOUNDATION_EXPORT const unsigned char MotifVersionString[];

#import <Motif/MTFThemeApplier.h>
#import <Motif/MTFDynamicThemeApplier.h>
#import <Motif/MTFLiveReloadThemeApplier.h>
#import <Motif/MTFTheme.h>
#import <Motif/MTFThemeClass.h>
#import <Motif/MTFErrors.h>
#import <Motif/MTFValueTransformerErrorHandling.h>
#import <Motif/MTFThemeClassApplicable.h>
#import <Motif/NSObject+ThemeClass.h>
#import <Motif/NSObject+ThemeClassAppliers.h>
#import <Motif/NSValueTransformer+Registration.h>
#import <Motif/NSValueTransformer+MTFRegistry.h>
#import <Motif/NSValueTransformer+TypeFiltering.h>
#import <Motif/MTFFileObservationContext.h>
#import <Motif/MTFObjCTypeValueTransformer.h>
#import <Motif/MTFReverseTransformedValueClass.h>
#import <Motif/MTFThemeClassPropertiesApplier.h>
#import <Motif/MTFThemeClassPropertyApplier.h>
#import <Motif/MTFThemeConstant.h>
#import <Motif/MTFThemeParser.h>
#import <Motif/MTFThemeSourceObserver.h>
#import <Motif/MTFThemeSymbolReference.h>
#import <Motif/NSBundle+ExtensionURLs.h>
#import <Motif/NSDictionary+DictionaryValueValidation.h>
#import <Motif/NSDictionary+IntersectingKeys.h>
#import <Motif/NSString+ThemeSymbols.h>
#import <Motif/NSURL+LastPathComponentWithoutExtension.h>
#import <Motif/NSURL+ThemeFiles.h>
#import <Motif/NSValueTransformer+MTFRegistry.h>
#import <Motif/MTFRuntimeExtensions.h>
#import <Motif/MTFYAMLSerialization.h>
#import <Motif/NSValueTransformer+MotifCGPoint.h>
#import <Motif/NSValueTransformer+MotifCGSize.h>

#if TARGET_OS_IPHONE
    #import <Motif/MTFScreenBrightnessThemeApplier.h>
    #import <Motif/NSValueTransformer+MotifUIColor.h>
    #import <Motif/NSValueTransformer+MotifUIEdgeInsets.h>
    #import <Motif/NSValueTransformer+MotifUIOffset.h>
    #import <Motif/UIColor+HTMLColors.h>
#endif
