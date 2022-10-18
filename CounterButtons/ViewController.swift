//
//  ViewController.swift
//  CounterButtons
//
//  Created by mobdev on 17-10-22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var valueLabel: UILabel!
    var valueInt: Int64 = 0
    var items: [Entity]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCounter()
        addTargets()
        fetchInt()
    }
    func prepareCounter(){
        let newValue = Entity(context: self.context)
        newValue.valueCD = valueInt
        do {
            try self.context.save()
        }
        catch {
        }
    }
    
    func fetchInt(){
        do {
            self.items = try context.fetch(Entity.fetchRequest())
            let itemsFirst = items?.first?.valueCD
            guard let itemsFirst = itemsFirst else {return}
            valueLabel.text = String(itemsFirst)
        }
        catch {
            
        }
    }
    
    func addTargets(){
        addButton.addTarget(self, action: #selector(add), for: .touchUpInside)
        removeButton.addTarget(self, action: #selector(remove), for: .touchUpInside)
    }
    
    
    @objc func add(){
        
        let itemValue = self.items!
        valueInt += 1
        itemValue.first?.valueCD = valueInt

        do {
            try self.context.save()
        }
        catch {
            
        }
        self.fetchInt()
        
    }
    @objc func remove(){
        if valueInt > 0{
            valueInt -= 1
        } else {
            valueInt = 0
        }
        let itemValue = self.items!
        itemValue.first?.valueCD = valueInt

        do {
            try self.context.save()
        }
        catch {
            
        }
        self.fetchInt()
    }
}

