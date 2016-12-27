//
//  TodoItemViewController.swift
//  TodoApp
//
//  Created by 我妻 直樹 on 2016/12/26.
//  Copyright © 2016年 Naoki Agatsuma. All rights reserved.
//

import UIKit
import CoreData

class TodoItemViewController: UIViewController {

    @IBOutlet weak var todoItem: UITextField!
    //let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController!.popViewController(animated: true)
    }
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let todo = Todo(context: context)
        todo.item = todoItem.text!
        
        //Save the data to to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
