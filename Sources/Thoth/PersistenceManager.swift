//
//  PersistenceManager.swift
//  Thoth
//
//  Created by Ajiaco on 2022/02/16.
//

import Foundation
import CoreData

@available(iOS 10.0, *)
public class PersistenceManager {
    
    static public var shared: PersistenceManager = PersistenceManager()
    static public var containerName: String = "defaultContainerName"
    static public var entityName: String = "efaultEntityName"
        
    private var persistenceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: PersistenceManager.containerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext {
        persistenceContainer.viewContext
    }
    
    func fetch<T: NSManagedObject>(_ pageNo: Int? = nil) -> [T] {
        let fetchRequest = NSFetchRequest<T>(entityName: PersistenceManager.entityName)
        if let pageNo = pageNo {
            fetchRequest.predicate = NSPredicate(format: "page=%d", pageNo)
        }
        do {
            let fetchResult = try context.fetch(fetchRequest)
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    @discardableResult
    func insert<T>(elements: T) -> Bool {
        
        guard let entity = NSEntityDescription.entity(forEntityName: PersistenceManager.entityName, in: context) else {
            return false
        }
        let managedObject = NSManagedObject(entity: entity, insertInto: self.context)

//        guard context.hasChanges else { return }
        
        do {
            guard let allElements = try (elements as? Loopable)?.allProperties() else {
                return false
            }
            
            allElements.forEach({
                managedObject.setValue($0.value, forKey: $0.key)
            })
            try context.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    @discardableResult
    func delete(object: NSManagedObject) -> Bool {
        self.context.delete(object)
        do{
            try self.context.save()
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func count<T: NSManagedObject>(request: NSFetchRequest<T>) -> Int? {
        do {
            let count = try self.context.count(for: request)
            return count
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    /*
    @discardableResult
    func deleteAll<T: NSManagedObject>(request: NSFetchRequest<T>) -> Bool {
        let request: NSFetchRequest<NSFetchRequestResult> = T.fetchRequest()
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        do {
            try self.context.execute(delete)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
     */
}
