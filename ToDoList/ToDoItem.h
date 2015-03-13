//
//  ToDoItem.h
//  ToDoList
//
//  Created by abruzzim on 3/12/15.
//  Copyright (c) 2015 Mario Abruzzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property            NSString *itemName;
@property            BOOL      completed;
@property (readonly) NSDate   *creationDate;

@end
