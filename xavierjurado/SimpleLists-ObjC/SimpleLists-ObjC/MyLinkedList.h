//
//  MyLinkedList.h
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 15/06/11.
//

#import <Foundation/Foundation.h>
#import "List.h"


@class MyLinkedNode;

@interface MyLinkedList : NSObject <List>

- (void)add:(MyLinkedNode *)node;
- (void)remove:(MyLinkedNode *)node;
- (MyLinkedNode *)nodeWithString:(NSString *)string;
- (NSArray *)values;

@end
