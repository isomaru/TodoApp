//
//  Todo+CoreDataProperties.swift
//  TodoApp
//
//  Created by 我妻 直樹 on 2016/12/26.
//  Copyright © 2016年 Naoki Agatsuma. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo");
    }

    @NSManaged public var item: String?

}
