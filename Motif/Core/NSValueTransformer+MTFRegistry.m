//
//  NSValueTransformer+MTFRegistry.m
//  Motif
//
//  Created by Dmitry Lizin on 30.04.2021.
//  Copyright © 2021 Eric Horacek. All rights reserved.
//

#import "NSValueTransformer+MTFRegistry.h"

@implementation NSValueTransformer (MTFRegistry)

+ (NSMutableDictionary <NSValueTransformerName, NSValueTransformer *> *)mtf_valueTransformerRegistry {
    static dispatch_once_t once;
    static NSMutableDictionary <NSValueTransformerName, NSValueTransformer *> * valueTransformerRegistry;
    dispatch_once(&once, ^{
        valueTransformerRegistry = [NSMutableDictionary new];
    });
    return valueTransformerRegistry;
}

+ (void)mtf_setValueTransformer:(nullable NSValueTransformer *)transformer forName:(NSValueTransformerName)name {
    if (transformer != nil) {
        [[self mtf_valueTransformerRegistry] setObject:transformer forKey:name];
    } else {
        [[self mtf_valueTransformerRegistry] removeObjectForKey:name];
    }
}

+ (nullable NSValueTransformer *)mtf_valueTransformerForName:(NSValueTransformerName)name {
    return [[self mtf_valueTransformerRegistry] objectForKey:name];
}

+ (NSArray<NSValueTransformerName> *)mtf_valueTransformerNames {
    return [[self mtf_valueTransformerRegistry] allKeys];
}

@end
