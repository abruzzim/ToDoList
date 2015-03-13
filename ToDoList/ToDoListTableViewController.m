//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by abruzzim on 3/12/15.
//  Copyright (c) 2015 Mario Abruzzi. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell"
                                                            forIndexPath:indexPath];
    
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    NSLog(@"indexPath.row is: %ld", (long)indexPath.row);
    
    cell.textLabel.text = toDoItem.itemName;
    NSLog(@"toDoItem.itemName is: %@", toDoItem.itemName);
    
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    /*
     Retrieve data from the AddToDoItemViewController to add an item to the to-do list.
     */
    
    // Retrieve the source view controller.
    AddToDoItemViewController *source = [segue sourceViewController];
    // Retrieve the value of the controller's "toDoItem" property.
    ToDoItem *item = source.toDoItem;
    
    if (item != nil) {
        
        [self.toDoItems addObject:item]; // Add the item to the "toDoItems" array.
        [self.tableView reloadData];     // Reload the data in the table.
    }
}

- (void)loadInitialData {
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Assess Patient";
    [self.toDoItems addObject:item1];
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"Give Oxygen";
    [self.toDoItems addObject:item2];
    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.itemName = @"Place 2 IVs / IO";
    [self.toDoItems addObject:item3];
    ToDoItem *item4 = [[ToDoItem alloc] init];
    item4.itemName = @"Draw POC Labs";
    [self.toDoItems addObject:item4];
    ToDoItem *item5 = [[ToDoItem alloc] init];
    item5.itemName = @"Draw Labs";
    [self.toDoItems addObject:item5];
    ToDoItem *item6 = [[ToDoItem alloc] init];
    item6.itemName = @"Give Fluids";
    [self.toDoItems addObject:item6];
    ToDoItem *item7 = [[ToDoItem alloc] init];
    item7.itemName = @"Assess POC Labs";
    [self.toDoItems addObject:item7];
    ToDoItem *item8 = [[ToDoItem alloc] init];
    item8.itemName = @"Treat Hypocalcemia";
    [self.toDoItems addObject:item8];
    ToDoItem *item9 = [[ToDoItem alloc] init];
    item9.itemName = @"Treat Hypoglycemia";
    [self.toDoItems addObject:item9];
    ToDoItem *item10 = [[ToDoItem alloc] init];
    item10.itemName = @"Treat Acidosis";
    [self.toDoItems addObject:item10];
    ToDoItem *item11 = [[ToDoItem alloc] init];
    item11.itemName = @"Order Ceftriaxone";
    [self.toDoItems addObject:item11];
    ToDoItem *item12 = [[ToDoItem alloc] init];
    item12.itemName = @"Order Vancomycin";
    [self.toDoItems addObject:item12];
    ToDoItem *item13 = [[ToDoItem alloc] init];
    item13.itemName = @"Treat Hypotension";
    [self.toDoItems addObject:item13];
    ToDoItem *item14 = [[ToDoItem alloc] init];
    item14.itemName = @"Reassess Patient";
    [self.toDoItems addObject:item14];
    ToDoItem *item15 = [[ToDoItem alloc] init];
    item15.itemName = @"Treat Adrenal Insufficiency";
    [self.toDoItems addObject:item15];
    ToDoItem *item16 = [[ToDoItem alloc] init];
    item16.itemName = @"Treat Hypotension";
    [self.toDoItems addObject:item16];
    ToDoItem *item17 = [[ToDoItem alloc] init];
    item17.itemName = @"Draw Blood Culture";
    [self.toDoItems addObject:item17];
    ToDoItem *item18 = [[ToDoItem alloc] init];
    item18.itemName = @"Give Antibiotics";
    [self.toDoItems addObject:item18];
    ToDoItem *item19 = [[ToDoItem alloc] init];
    item19.itemName = @"Give Fluids";
    [self.toDoItems addObject:item19];
}

#pragma mark - Table view delagate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"ToDoListTableViewController-I-DEBUG, In tableView:didSelectRowAtIndexPath:");
    // Deselect the cell immediately after selection.
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    // Search for ToDoItem in toDoItems corresponding to tapped cell.
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    NSLog(@"ToDoListTableViewController-I-DEBUG, indexPath.row is: %lu", indexPath.row);
    // Toggle the completion state.
    tappedItem.completed = !tappedItem.completed;
    //Reload updated table view row
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}

@end
