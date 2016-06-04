//
//  CSDocumentsManager.h
//  smarthouse
//
//  Created by Krzysztof Kapitan on 04.06.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSDocumentsManager : NSObject

@property (nonatomic, strong, readonly) NSString *storageName;

- (instancetype)initWithStorageName:(NSString *)name;

- (void)write:(NSData *)data;
- (NSData *)read;

@end
