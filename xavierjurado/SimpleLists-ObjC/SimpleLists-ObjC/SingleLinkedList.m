//
//  SingleLinkedList.m
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 12/06/11.
//

#import "SingleLinkedList.h"
#import "SingleLinkedNode.h"


@interface SingleLinkedList ()
@property (nonatomic, retain) SingleLinkedNode *rootNode;
@property (nonatomic, retain) SingleLinkedNode *lastNode;
@end


@implementation SingleLinkedList
@synthesize rootNode;
@synthesize lastNode;

- (id)init
{
   self = [super init];
   if (self)
   {
      SingleLinkedNode *root = [[SingleLinkedNode alloc] init];
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

- (void)add:(SingleLinkedNode *)node
{
   if (!node)
      return;
   
   self.lastNode.nextNode = node;
   self.lastNode = node;
}

- (void)remove:(SingleLinkedNode *)node
{
   if (!node)
      return;
   
   // rootNode is private and can't be deleted
   if (node == self.rootNode)
      return;
   
   SingleLinkedNode *iterator = self.rootNode;
   while (iterator && (iterator.nextNode != node)) // Search is O(n)
   {
      iterator = iterator.nextNode;
   }
   
   // iterator contains the SingleLinkedNode before the wanted node, or nil
   if (iterator)
   {
      if (iterator.nextNode == self.lastNode)
         self.lastNode = iterator;
      
      iterator.nextNode = iterator.nextNode.nextNode;
   }
}

- (SingleLinkedNode *)nodeWithString:(NSString *)string
{
   if (!string)
      return nil;
   
   SingleLinkedNode *iterator = self.rootNode.nextNode;
   while (iterator && ![iterator.value  isEqualToString:string])
   {
      iterator = iterator.nextNode;
   }
   
   return iterator;
}

- (NSArray *)values
{
   NSMutableArray *values = [NSMutableArray array];
   
   SingleLinkedNode *iterator = self.rootNode.nextNode;
   while (iterator)
   {
      [values addObject:iterator.value];
      iterator = iterator.nextNode;
   }

   return [[values copy] autorelease];
}

@end
