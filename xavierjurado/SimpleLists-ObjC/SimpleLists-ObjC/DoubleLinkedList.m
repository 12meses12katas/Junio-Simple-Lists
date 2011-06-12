//
//  DoubleLinkedList.m
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 12/06/11.
//

#import "DoubleLinkedList.h"
#import "DoubleLinkedNode.h"


@interface DoubleLinkedList ()
@property (nonatomic, retain) DoubleLinkedNode *rootNode;
@property (nonatomic, retain) DoubleLinkedNode *lastNode;
@end


@implementation DoubleLinkedList

@synthesize rootNode;
@synthesize lastNode;

#pragma mark - NSObject

- (id)init
{
    self = [super init];
    if (self)
    {
       DoubleLinkedNode *root = [[DoubleLinkedNode alloc] init];
       self.rootNode = root;
       self.lastNode = root;
       [root release];
    }
    
    return self;
}

- (void)dealloc
{
   [rootNode release];
   rootNode = nil;
   [lastNode release];
   lastNode = nil;
   
   [super dealloc];
}

#pragma mark - List

- (void)add:(DoubleLinkedNode *)node
{
   if (!node)
      return;
   
   self.lastNode.nextNode = node;
   node.prevNode = self.lastNode;
   self.lastNode = node;
}

- (void)remove:(DoubleLinkedNode *)node
{
   if (!node)
      return;
   
   if (node == self.rootNode)
      return;
   
   DoubleLinkedNode *iterator = self.rootNode.nextNode;
   while (iterator && iterator != node)
   {
      iterator = iterator.nextNode;
   }
   
   if (iterator)
   {
      if (self.lastNode == iterator)
         self.lastNode = iterator.prevNode;
      
      iterator.prevNode.nextNode = iterator.nextNode;
      iterator.nextNode.prevNode = iterator.prevNode;
   }
}

// Same as SingleLinkedList
- (DoubleLinkedNode *)nodeWithString:(NSString *)string
{
   if (!string)
      return nil;
   
   DoubleLinkedNode *iterator = self.rootNode.nextNode;
   while (iterator && ![iterator.value isEqualToString:string])
   {
      iterator = iterator.nextNode;
   }
   
   return iterator;
}

- (NSArray *)values
{
   NSMutableArray *values = [NSMutableArray array];
   
   DoubleLinkedNode *iterator = self.rootNode.nextNode;
   while (iterator)
   {
      [values addObject:iterator.value];
      iterator = iterator.nextNode;
   }
   
   return [[values copy] autorelease];
}

@end
