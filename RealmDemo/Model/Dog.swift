
import Foundation
import RealmSwift

// Define your models like regular Swift classes
final class Dog: Object {
  @Persisted var name: String
  @Persisted var age: Int
}
