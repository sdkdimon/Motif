//
//  NSValueTransformer+MTFRegistry.h
//  Motif
//
//  Created by Dmitry Lizin on 30.04.2021.
//  Copyright © 2021 Eric Horacek. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSValueTransformer (MTFRegistry)

+ (void)mtf_setValueTransformer:(nullable NSValueTransformer *)transformer forName:(NSValueTransformerName)name;
+ (nullable NSValueTransformer *)mtf_valueTransformerForName:(NSValueTransformerName)name;
+ (NSArray<NSValueTransformerName> *)mtf_valueTransformerNames;

@end

NS_ASSUME_NONNULL_END
