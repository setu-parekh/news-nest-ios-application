//
//  ArticleModel.swift
//  News Nest
//
//  Created by Neel B Gandhi on 11/25/20.
//  Copyright © 2020 Setu Parekh. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrieved(_ articles:[Article])
}

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    var apiKey = "99729648174a4ce5b2711ce5001f02d3"
    var category = "General"
    var country = "USA"
    var countryMap = ["USA":"us", "Australia":"au", "India":"in", "UK":"gb", "UAE":"ae", "Germany":"de", "China":"cn"]
    
    func getArticles() {
        
        // Send the request to the News API
        // Create a string URL
        let location:String = countryMap[country]!
        let urlString = "https://newsapi.org/v2/top-headlines?country=" + location + "&category=" + category.lowercased() + "&apiKey=" + apiKey
        
        
        // Create a URL object
        let url = URL(string: urlString)
        
        // Check that URL object is not nil
        guard url != nil else {
            print("Failed to create URL Object.")
            return
        }
        
        // Create URLSession
        let urlSession = URLSession.shared
        
        // Create DataTask
        let dataTask = urlSession.dataTask(with: url!) { (data, response, error) in
            // Check that there are no errors and the data is present
            if error == nil && data != nil {
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do {
                    // Parse the JSON data into ArticleService data
                    let articlesServiceData = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get list of articles
                    let articles = articlesServiceData.articles!
                    
                    DispatchQueue.main.async {
                        // Pass the articles back to view controller from main thread
                        self.delegate?.articlesRetrieved(articles)
                    }
                }
                catch {
                    print("Error parsing JSON response")
                }
            }
        }
        
        // Resume the DataTask
        dataTask.resume()
    }
}
