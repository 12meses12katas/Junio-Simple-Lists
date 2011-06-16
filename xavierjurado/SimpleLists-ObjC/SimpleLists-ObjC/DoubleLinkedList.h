//
//  DoubleLinkedList.h
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 12/06/11.
//

#import <Foundation/Foundation.h>
#import "List.h"


@class DoubleLinkedNode;

@interface DoubleLinkedList : NSObject <List>

- (void)add:(DoubleLinkedNode *)node;
- (void)remove:(DoubleLinkedNode *)node;
- (DoubleLinkedNode *)nodeWithString:(NSString *)string;
- (NSArray *)values;

@end
