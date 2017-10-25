//
//  ViewController.swift
//  QuizPhone
//
//  Created by Muhammad Hilmy Fauzi on 25/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var etPhoneName: UITextField!
    @IBOutlet weak var etPhoneType: UITextField!
    @IBOutlet weak var etPhoneMerk: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnSave(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let nameTask = Phone(context: context)
        
        nameTask.phone_task = etPhoneName.text
        nameTask.type_task = etPhoneType.text
        nameTask.merk_task = etPhoneMerk.text
        
        if etPhoneName.text! == "" && etPhoneType.text! == "" && etPhoneMerk.text! == "" {
            //condition if nil
            //display alert dialog
            let alertController = UIAlertController(title: "Warning",
                                                    message: "Phone Profile Can't Be Empty", preferredStyle : .alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                                    style: .default,handler: nil))
            present(alertController, animated: true, completion: nil)
        }else{
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            _ = navigationController?.popViewController(animated: true)
            
            //print if the data has been added
            print("Data has been added")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

