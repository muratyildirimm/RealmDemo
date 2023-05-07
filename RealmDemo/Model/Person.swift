
import Foundation
import RealmSwift

final class Person: Object {
  @Persisted var name: String
  @Persisted var age: Int
}
