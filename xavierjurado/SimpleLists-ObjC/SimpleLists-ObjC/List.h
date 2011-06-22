//
//  List.h
//  SimpleLists-ObjC
//
//  Created by Xavier Jurado on 11/06/11.
//

#import <Foundation/Foundation.h>


@protocol Node;

@protocol List <NSObject>

/**
 * Add a node to the end of the list.
 *
 * @parameter node The node to be inserted.
 */
- (void)add:(id <Node>)node;

/**
 * Delete a node from the list.
 *
 * @param node The node to be deleted.
 */
- (void)remove:(id <Node>)node;

/**
 * Ask the list if it contains a given string.
 *
 * @param string The value to be searched.
 * @return Returns the node containing that string, or nil if no node was found
 * with that value.
 */
- (id <Node>)nodeWithString:(NSString *)string;

/**
 * Ask the list to return an array of all its values.
 *
 * @return An array of all list's values (instances of NSString *).
 */
- (NSArray *)values;

@end
