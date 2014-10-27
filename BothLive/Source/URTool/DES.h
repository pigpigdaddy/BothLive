//
//  DES.h
//  ModelDemo
//
//  Created by Tr Li on 11-11-3.
//  Copyright (c) 2011年 imohoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMBase64.h" 
#import <CommonCrypto/CommonCryptor.h>
 
@interface DES : NSObject

+ (NSString *)TripleDES:(NSString*)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt key:(NSString*)key;

//对3des进行加密
+ (NSString *)encryptString:(NSString *)string;

//对3des进行解密
+ (NSString *)decryptString:(NSString *)string; 

@end
