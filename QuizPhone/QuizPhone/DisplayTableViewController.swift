//
//  DisplayTableViewController.swift
//  QuizPhone
//
//  Created by Muhammad Hilmy Fauzi on 25/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class DisplayTableViewController: UITableViewController {
    var tasks: [Phone] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPhone", for: indexPath) as! PhoneTableViewCell

        let dataTask = tasks[indexPath.row]
        //put data eith attributs name_task
        if let myDataPhone1 = dataTask.phone_task {
            //display data to label
            cell.LabelPhone.text = myDataPhone1
        }
        if let myDataPhone2 = dataTask.type_task {
            //display data to label
            cell.labelType.text = myDataPhone2
        }
        if let myDataPhone3 = dataTask.merk_task {
            //display data to label
            cell.labelMerk.text = myDataPhone3
        }

        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        //call method getData()
        getData()
        //call reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //check what there is error or not
        do {
            //condition if nothing error
            //so will request download data
            tasks = try context.fetch(Phone.fetchRequest())
        }catch{
            //condition if error fatch data
            print("Fetching Failed")
        }
    }
    
    //add data to delete data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //check swipe menu if the editing style is delete
            let task = tasks[indexPath.row]
            context.delete(task)
            //delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                //retrieve data
                tasks = try context.fetch(Phone.fetchRequest())
            } catch {
                print("Fetching Failed")
            }
        }
        //load data again
        tableView.reloadData()
    }
}
