//
//  MyLinkedNode.h
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 15/06/11.
//

#import <Foundation/Foundation.h>
#import "Node.h"


@interface MyLinkedNode : NSObject <Node>

@property (nonatomic, copy) NSString *value;

- (id)init;
- (id)initWithString:(NSString *)value;
+ (id)nodeWithString:(NSString *)value;

@end
