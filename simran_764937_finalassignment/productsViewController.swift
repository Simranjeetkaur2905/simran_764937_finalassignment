//
//  productsViewController.swift
//  simran_764937_finalassignment
//
//  Created by Simran Chakkal on 2020-01-24.
//  Copyright © 2020 simran. All rights reserved.
//

import UIKit

import CoreData

class productsViewController: UIViewController {
    
    //var products: [Product]?

    @IBOutlet var name: UITextField!
    
    @IBOutlet var price: UITextField!
    @IBOutlet var id: UITextField!
    
    @IBOutlet var productdescription: UITextField!
    
    var textString1: String?
    var textString2: String?
    var textString3: String?
    var textString4: String?
    
    weak var taskTable: productnameTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = textString1
        id.text = textString2
        productdescription.text = textString3
        price.text = textString4
    
        
        
        // Do any additional setup after loading the view.
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
                        name.text = productName
                        id.text = productId
                        price.text = String(productPrice)
                        productdescription.text = productDescription
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
