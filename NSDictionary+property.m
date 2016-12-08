//
//  NSDictionary+property.m
//  runTime
//
//  Created by 蔡翔 on 16/11/8.
//  Copyright © 2016年 蔡翔. All rights reserved.
//

#import "NSDictionary+property.h"

@implementation NSDictionary (property)
/**
 生成属性代码
 根据字典中所有的key
 */
- (void)creatProperty
{
    NSMutableString *codes = [NSMutableString string];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *code;
        if ([obj isKindOfClass:[NSString class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic , copy) NSString*%@",key];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic , assign) BOOL %@",key];
        }else if ([obj isKindOfClass:[NSNumber class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic , assign) NSInteger %@",key];
        }else if ([obj isKindOfClass:[NSArray class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic , strong) NSArray*%@",key];
        }else if ([obj isKindOfClass:[NSDictionary class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic , strong) NSDictionary*%@",key];
        }        [codes appendFormat:@"\n%@\n", code];
    }];
    
    NSLog(@"%@",codes);
}

@end
