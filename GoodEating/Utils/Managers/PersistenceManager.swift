//
//  PersistenceManager.swift
//  GoodEating
//
//  Created by Deonte Kilgore on 10/18/22.
//

import CoreData
import Foundation

final class PersistenceManager: ObservableObject {
    let container = NSPersistentContainer(name: "FavoriteMenuItem")
    
    static let shared = PersistenceManager()
    
    private init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

extension PersistenceManager {
    
    func save(_ favoriteItem: MenuItem) {
        guard checkIfFavorite(favoriteItem.id) == false else { return }
        
        let favorite = FavoriteMenuItem(context: container.viewContext)
        
        favorite.id = favoriteItem.id
        favorite.img = favoriteItem.img
        favorite.dsc = favoriteItem.dsc
        favorite.name = favoriteItem.name
        favorite.price = favoriteItem.price
        favorite.rate = favoriteItem.rate
        favorite.country = favoriteItem.country
        
        do {
            try container.viewContext.save()
        } catch {
            container.viewContext.rollback()
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func delete(_ favorite: FavoriteMenuItem) {
        let context = container.viewContext
        context.delete(favorite)
    }
    
    func delete(_ menuItem: MenuItem) {
        guard checkIfFavorite(menuItem.id) == true else { return }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteMenuItem")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "id == %@", menuItem.id)
        
        do {
            let context = container.viewContext
            let object = try context.fetch(fetchRequest).first
            context.delete(object as! NSManagedObject)
        } catch {
            container.viewContext.rollback()
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func fetchAllfavorites() -> NSFetchRequest<FavoriteMenuItem> {
        let request: NSFetchRequest<FavoriteMenuItem> = FavoriteMenuItem.fetchRequest()
        let sortDescriptors = NSSortDescriptor(key: "rate", ascending: true)
        request.sortDescriptors = [sortDescriptors]
        return request
    }
    
    func checkIfFavorite(_ id: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteMenuItem")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        return ((try? container.viewContext.count(for: fetchRequest)) ?? 0) > 0
    }
    
}
