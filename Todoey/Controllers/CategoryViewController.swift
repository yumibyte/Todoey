//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Ashley Raigosa on 7/12/19.
//  Copyright © 2019 Ashley Raigosa. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    // global variables
    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    

    //MARK: - Add new Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Create a Container", style: .default) { (action) in
            
            let newCategory = Category(context: self.context)
            
            newCategory.name = textField.text!
            
            self.categoryArray.append(newCategory)
            
            self.saveCategory()
        }
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Add A New Category."
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArray[indexPath.row].name
        
        return cell
    }
    //MARK: - TableView Delegate Methods - not
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToitems", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    
    func loadCategories() {

        let request: NSFetchRequest<Category> =  Category.fetchRequest()
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error occurred fetching data. \(error)")
        }
        tableView.reloadData()
    }
    
    func saveCategory() {
                
        do {
            try context.save()
        } catch {
            print("Error occurred saving categories. \(error)")
        }
        tableView.reloadData()
    }
    
}
