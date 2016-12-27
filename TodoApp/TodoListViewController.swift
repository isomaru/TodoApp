//
//  ViewController.swift
//  TodoApp
//
//  Created by 我妻 直樹 on 2016/12/26.
//  Copyright © 2016年 Naoki Agatsuma. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var todoTableView: UITableView!
    
    var todos : [Todo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.dataSource = self
        todoTableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from core data
        getData()
        
        //reload the table view
        todoTableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let todo = todos[indexPath.row]
        
        cell.textLabel?.text = "😀 \(todo.item!)"
        
        
        
        return cell
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
        todos = try context.fetch(Todo.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
        
    }
    

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let todo = todos[indexPath.row]
            context.delete(todo)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                todos = try context.fetch(Todo.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        todoTableView.reloadData()
    }

}

