//
//  ViewController.swift
//  RealmDemo
//
//  Created by Murat Yıldırım on 7.05.2023.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
  
  
  @IBOutlet weak var tableView: UITableView!
  // Open the local-only default realm
  let realm = try! Realm()
  var personList = [Person]()

  override func viewDidLoad() {
    super.viewDidLoad()
   // savePerson(name: "ahmet", age: 45)
    renderPerson()
    
  }
  
  // Fetch all the Person objects
  func renderPerson() {
    
      let people = realm.objects(Person.self)
      for person in people {
        dump(person)
        personList.append(person)
      }
    
    
    
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
    
    // şunu da yapabilirsin.
    //try! realm.write {
    // realm.add(todo)
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



