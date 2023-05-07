
import UIKit
import RealmSwift


class ViewController: UIViewController {
  // MARK: IBOutlet
  @IBOutlet weak var tableView: UITableView!
  // Open the local-only default realm
  let realm = try! Realm()
  var personList = [Person]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    savePerson(name: "new2", age: 25)
    renderPerson()
    // renderPerson()
    // deleteAllPerson()
  }
  // Fetch all the Person objects
  func renderPerson() {
    let people = realm.objects(Person.self)
    for person in people {
      personList.append(person)
      // dump(person)
    }
  }
  
  func deleteAllPerson() {
    realm.beginWrite()
    realm.delete(realm.objects(Person.self))
    try! realm.commitWrite()
  }
  
  func savePerson(name: String, age: Int) {
    let person = Person()
    person.name = name
    person.age = age
    realm.beginWrite()
    realm.add(person)
    do {
      try realm.commitWrite()
    } catch {
      print(error.localizedDescription)
    }
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PersonCell
    cell.nameLabel.text = self.personList[indexPath.row].name
    cell.ageLabel.text = String(self.personList[indexPath.row].age)
    return cell
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    personList.count
  }
}
