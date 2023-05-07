//
//  Person.swift
//  RealmDemo
//
//  Created by Murat Yıldırım on 7.05.2023.
//

import Foundation
import RealmSwift

class Person: Object {
  // @Persisted(primaryKey: true) var _id: String
  @Persisted var name: String
  @Persisted var age: Int
  // Create relationships by pointing an Object field to another Class
  //@Persisted var dogs: List<Dog>;
}
