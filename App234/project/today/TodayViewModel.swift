//
//  TodayViewModel.swift
//  App234
//
//  Created by Вячеслав on 10/25/23.
//

import SwiftUI
import CoreData

final class TodayViewModel: ObservableObject {
    
    @AppStorage("affirmations") var affirmations: [String] = []
    @Published var quotes: [QuoteModel] = []
    
    @Published var name: String = ""
    @Published var caption: String = ""
    @Published var quote: String = ""
    
    @Published var affirmation_text: String = ""
    
    func fetchProperties() {
        
        CoreDataStack.shared.modelName = "QuoteModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<QuoteModel>(entityName: "QuoteModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.quotes = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.quotes = []
        }
    }
    
    func addQuote(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "QuoteModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "QuoteModel", into: context) as! QuoteModel
        
        trans.name = name
        trans.caption = caption
        trans.quote = quote
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}
