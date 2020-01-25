//
//  productnameTableViewController.swift
//  simran_764937_finalassignment
//
//  Created by Simran Chakkal on 2020-01-24.
//  Copyright © 2020 simran. All rights reserved.
//

import UIKit

import CoreData

class productnameTableViewController: UITableViewController {
    
    @IBOutlet var searchbar: UISearchBar!
    
    
    var filteredProducts: [Product]?

       weak var delegate: productsViewController?
       var curIndex = -1
    var products: [Product]?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        loadCoreData()
        filteredProducts = products
        searchbar.delegate = self
        saveCoreData()
         
              
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = products![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = product.productName

        return cell!
    }
    

    
    
    @objc func saveCoreData(){
        
               clearCoreData()
        
               let appDelegate = UIApplication.shared.delegate as! AppDelegate
                  
                let context = appDelegate.persistentContainer.viewContext
                      
                      //3rd step: write into the context
                      
                      
                let product1 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                      
                product1.setValue("TV", forKey: "name")
                product1.setValue("apple", forKey: "id")
                product1.setValue(" Television", forKey: "descriptions")
                product1.setValue(300, forKey: "price")
               
               
                let product2 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
               
                product2.setValue(" Machine", forKey: "name")
                product2.setValue("234", forKey: "id")
                product2.setValue(" Washing Machine", forKey: "descriptions")
                       product2.setValue(210, forKey: "price")
        
                let product3 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                               
                product3.setValue("Mixer grinder", forKey: "name")
                product3.setValue("2345", forKey: "id")
                product3.setValue("mixer", forKey: "descriptions")
                product3.setValue(100, forKey: "price")
                        
                        
                let product4 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                        
                product4.setValue("motorcycle", forKey: "name")
                product4.setValue("2345", forKey: "id")
                product4.setValue("fastest motorcycle", forKey: "descriptions")
                product4.setValue(100, forKey: "price")
        
                let product5 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                                      
                product5.setValue("car", forKey: "name")
                product5.setValue("2345", forKey: "id")
                product5.setValue("fastest car", forKey: "descriptions")
                product5.setValue(150, forKey: "price")
                               
                               
                let product6 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                               
                product6.setValue("Mac pro", forKey: "name")
                product6.setValue("12234", forKey: "id")
                product6.setValue("mac pro 265", forKey: "descriptions")
                product6.setValue(2000, forKey: "price")
        
                let product7 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                                      
                product7.setValue("clothes", forKey: "name")
                product7.setValue("2345", forKey: "id")
                product7.setValue("holister", forKey: "descriptions")
                product7.setValue(80, forKey: "price")
                               
                               
                let product8 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                               
                product8.setValue("vegetables", forKey: "name")
                product8.setValue("122345", forKey: "id")
                product8.setValue("healthy", forKey: "descriptions")
                product8.setValue(70, forKey: "price")
        
                let product9 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
               
               product9.setValue("Ipad", forKey: "name")
               product9.setValue("ab9", forKey: "id")
               product9.setValue(" Ipad 8", forKey: "descriptions")
               product9.setValue(1500, forKey: "price")
        
        
                let product10 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
        
                product10.setValue("Mobile phone", forKey: "name")
                product10.setValue("3456", forKey: "id")
                product10.setValue("iphone max", forKey: "descriptions")
                product10.setValue(1800, forKey: "price")
                      
                      // 4th step: save context
                      
                      do{
                          try context.save()
                          print(product1, "is saved")
                          print(product2, "is saved")
                      }
                      catch{
                          print(error)
                      }
    }
    
    func loadCoreData(){
        
        products = [Product]()
        
        //create an instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
        /*
            Second we need the context
            This context is the manager like location manager, audio manager etc
         */
                
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductModel")
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            if results is [NSManagedObject]{
                for result in results as! [NSManagedObject]{
                    let productName = result.value(forKey: "name") as! String
                    let productId = result.value(forKey: "id") as! String
                    let productDescription = result.value(forKey: "descriptions") as! String
                    let productPrice = result.value(forKey: "price") as! Int
                    products?.append(Product(productName: productName, productId: productId, productDescription: productDescription, price: productPrice))
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
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductModel")
        
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
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              // Get the new view controller using segue.destination.
              // Pass the selected object to the new view controller.
              
              if let detailView = segue.destination as? productsViewController{
                  detailView.taskTable = self
                  //detailView.tasks = tasks
                  
                  if let tableViewCell = sender as? UITableViewCell{
                      if let index = tableView.indexPath(for: tableViewCell)?.row{
                        detailView.textString1 = products![index].productName
                        detailView.textString2 = products![index].productId
                        detailView.textString3 = products![index].productDescription
                        detailView.textString4 = String(products![index].price)
                          
                          curIndex = index
                      }
                  }
                  
             }
          
          }

    }

    extension productnameTableViewController: UISearchBarDelegate{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredProducts = searchText.isEmpty ? products : products?.filter({ (item: Product) -> Bool in
            return item.productName.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableView.reloadData()
      }
    }





