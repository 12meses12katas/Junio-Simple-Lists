//
//  SingleLinkedNode.h
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 12/06/11.
//

#import <Foundation/Foundation.h>
#import "Node.h"


@interface SingleLinkedNode : NSObject <Node>

@property (nonatomic, copy) NSString *value;
@property (nonatomic, retain) SingleLinkedNode *nextNode;

- (id)init;
- (id)initWithValue:(NSString *)value;

@end
