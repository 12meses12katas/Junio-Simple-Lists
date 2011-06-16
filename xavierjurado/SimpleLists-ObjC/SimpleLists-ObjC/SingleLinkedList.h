//
//  SingleLinkedList.h
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 12/06/11.
//

#import <Foundation/Foundation.h>
#import "List.h"


@class SingleLinkedNode;

@interface SingleLinkedList : NSObject <List>

- (void)add:(SingleLinkedNode *)node;
- (void)remove:(SingleLinkedNode *)node;
- (SingleLinkedNode *)nodeWithString:(NSString *)string;
- (NSArray *)values;

@end
