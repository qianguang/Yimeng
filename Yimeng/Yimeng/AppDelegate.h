//
//  AppDelegate.h
//  Yimeng
//
//  Created by LQG on 16/2/7.
//  Copyright © 2016年 LQG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)loginSuccess;
- (void)logoutSuccess;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

