//
//  NSValueTransformer+TypeFiltering.m
//  Motif
//
//  Created by Eric Horacek on 3/9/15.
//  Copyright (c) 2015 Eric Horacek. All rights reserved.
//

#import "NSValueTransformer+TypeFiltering.h"
#import "MTFReverseTransformedValueClass.h"
#import "MTFObjCTypeValueTransformer.h"
#import "NSValueTransformer+MTFRegistry.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSValueTransformer (TypeFiltering)

+ (nullable NSValueTransformer *)mtf_valueTransformerForTransformingObject:(id)object toObjCType:(const char *)objCType {
    NSParameterAssert(object != nil);
    NSParameterAssert(objCType != NULL);
    
    NSArray<NSString *> *valueTransformerNames = [NSValueTransformer mtf_valueTransformerNames];
    
    for (NSString *valueTransformerName in valueTransformerNames) {
        NSValueTransformer *valueTransfomerForName = [NSValueTransformer mtf_valueTransformerForName:valueTransformerName];
        BOOL isObjCTypeTransformer = [valueTransfomerForName conformsToProtocol:@protocol(MTFObjCTypeValueTransformer)];
        BOOL hasKnownInputClass = [valueTransfomerForName conformsToProtocol:@protocol(MTFReverseTransformedValueClass)];
        
        if (isObjCTypeTransformer && hasKnownInputClass) {
            NSValueTransformer <MTFObjCTypeValueTransformer, MTFReverseTransformedValueClass> *valueTransformer;
            valueTransformer = (id)valueTransfomerForName;
            Class inputClass = [valueTransformer.class reverseTransformedValueClass];
            const char * outputObjCType = [valueTransformer.class transformedValueObjCType];
            
            BOOL canTransformObject = [object isKindOfClass:inputClass];
            BOOL isValidTransformation = (strcmp(outputObjCType, objCType) == 0);
            
            if (canTransformObject && isValidTransformation) {
                return valueTransformer;
            }
        }
    }

    return nil;
}

+ (nullable NSValueTransformer *)mtf_valueTransformerForTransformingObject:(id)object toClass:(Class)toClass {
    NSParameterAssert(object != nil);
    NSParameterAssert(toClass != Nil);
    
    NSArray<NSString *> *valueTransformerNames = [NSValueTransformer mtf_valueTransformerNames];
    
    for (NSString *valueTransformerName in valueTransformerNames) {
        NSValueTransformer *valueTransfomerForName = [NSValueTransformer mtf_valueTransformerForName:valueTransformerName];
        BOOL hasKnownInputClass = [valueTransfomerForName conformsToProtocol:@protocol(MTFReverseTransformedValueClass)];
        
        if (hasKnownInputClass) {
            NSValueTransformer <MTFReverseTransformedValueClass> *valueTransformer;
            valueTransformer = (id)valueTransfomerForName;
            Class reverseTransformedValueClass = [valueTransformer.class reverseTransformedValueClass];
            Class transformedValueClass = [valueTransformer.class transformedValueClass];
            
            BOOL canTransformObject = [object isKindOfClass:reverseTransformedValueClass];
            BOOL isValidTransformation = (toClass == transformedValueClass);
            
            if (canTransformObject && isValidTransformation) {
                return valueTransformer;
            }
        }
    }
    
    return nil;
}

@end

NS_ASSUME_NONNULL_END
