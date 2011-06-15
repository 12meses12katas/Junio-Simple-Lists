//
//  MyLinkedList.m
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 15/06/11.
//

#import "MyLinkedList.h"
#import "MyLinkedNode.h"


@interface MyLinkedList ()
@property (nonatomic, retain) NSMutableArray *nodes;
@end


@implementation MyLinkedList

@synthesize nodes;

- (id)init
{
   self = [super init];
   if (self) 
   {
      self.nodes = [NSMutableArray array];
   }
   
   return self;
}

- (void)dealloc
{
   [nodes release];
   nodes = nil;

   [super dealloc];
}

#pragma mark - List

- (void)add:(MyLinkedNode *)node
{
   if (!node)
      return;
   
   [self.nodes addObject:node];
}

- (void)remove:(MyLinkedNode *)node
{
   if (!node)
      return;
   
   [self.nodes removeObject:node];
}

- (MyLinkedNode *)nodeWithString:(NSString *)string
{
   for (MyLinkedNode *node in self.nodes)
   {
      if ([node.value isEqualToString:string])
         return node;
   }
   
   return nil;
}

- (NSArray *)values
{
   return [[self.nodes copy] autorelease];
}

@end
