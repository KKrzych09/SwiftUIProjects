//
//  Persistence.swift
//  MusicBud1.0
//
//  Created by Kamil Krzych on 05/08/2022.
//

import CoreData
import UIKit

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let album = Album(context: viewContext)
        
        album.name = "Romantic Psycho (JPN Edition)"
        album.artistName = "Quebonafide"
        album.location = "Tokyo"
        album.phone = "69-420-33"
        album.summary = "ROMANTIC PSYCHO (Japan Edition)” to limitowany album Quebonafide, który był dodawany w preorderze do pierwszego wydania albumu “ROMANTIC PSYCHO”. W wersji japońskiej znajduje się 16 podstawowych oraz 3 bonusowe numery. Ta była dostępna tylko w preorderze “ROMANTIC PSYCHO” i do wyczerpania nakładu na stronie QueShop.pl, po jej wyprzedaniu nigdy więcej nie będzie dostępna."
        album.image = (UIImage(named: "romantic_psycho_jpn")?.pngData())!
        album.isFavorite = false
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    static var testData: [Album]? = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Album")
        return try? PersistenceController.preview.container.viewContext.fetch(fetchRequest) as? [Album]
    }()
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MusicBud1_0")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error ) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
