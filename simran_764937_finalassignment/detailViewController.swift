//
//  detailViewController.swift
//  simran_764937_finalassignment
//
//  Created by Simran Chakkal on 2020-01-24.
//  Copyright © 2020 simran. All rights reserved.
//

import UIKit

import CoreData

class detailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCoreData()
        saveCoreData()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func saveCoreData(){
        
               clearCoreData()
        
               let appDelegate = UIApplication.shared.delegate as! AppDelegate
                  
                let context = appDelegate.persistentContainer.viewContext
                      
                      //3rd step: write into the context
                      
                      
                let product1 = NSEntityDescription.insertNewObject(forEntityName: "ProductMod", into: context)
                      
                product1.setValue("TV", forKey: "product_name")
                product1.setValue("apple", forKey: "product_id")
                product1.setValue("Television", forKey: "product_descriptions")
                product1.setValue(140, forKey: "product_price")
               
               
               
                      // 4th step: save context
                      
                      do{
                          try context.save()
                          print(product1, "is saved")
                      }
                      catch{
                          print(error)
                      }
    }
    
    
    
    func loadCoreData(){
        
        
        
        //create an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
        /*
            Second we need the context
            This context is the manager like location manager, audio manager etc
         */
                
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductMod")
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            if results is [NSManagedObject]{
                for result in results as! [NSManagedObject]{
                    let productName = result.value(forKey: "product_name") as! String
                    let productId = result.value(forKey: "product_id") as! String
                    let productDescription = result.value(forKey: "product_descriptions") as! String
                    let productPrice = result.value(forKey: "product_price") as! Int
                    nameField.text = productName
                    idField.text = productId
                    priceField.text = String(productPrice)
                    descriptionField.text = productDescription
                }
            }
        }
        catch{
            print(error)
        }
        
        
    }
    
    func clearCoreData(){
        
        //create an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
        /*
            Second we need the context
            This context is the manager like location manager, audio manager etc
         */
                
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductMod")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            for managedObjects in results{
                if let managedObjectData = managedObjects as? NSManagedObject{
                    managedContext.delete(managedObjectData)
                }
            }
        }
        catch{
            print(error)
        }
    }

}
