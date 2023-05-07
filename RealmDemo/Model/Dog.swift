//
//  Dog.swift
//  RealmDemo
//
//  Created by Murat Yıldırım on 7.05.2023.
//

import Foundation
import RealmSwift

// Define your models like regular Swift classes
class Dog: Object {
  @Persisted var name: String
  @Persisted var age: Int
}

