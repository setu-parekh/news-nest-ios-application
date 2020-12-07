//
//  ViewController.swift
//  News Nest
//
//  Created by Neel B Gandhi on 11/25/20.
//  Copyright © 2020 Setu Parekh. All rights reserved.
//

import UIKit
import iOSDropDown

class ViewController: UIViewController {
    var articleModel = ArticleModel()
    var articles = [Article]()
    var categories = ["General", "Business", "Health", "Science", "Sports", "Technology"]
    var countries = ["USA", "Australia", "India", "UK", "UAE", "Germany", "China"]
    
    @IBOutlet weak var articlesTableView: UITableView!
    @IBOutlet weak var categorySelection: DropDown!
    @IBOutlet weak var countrySelection: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view controller as delegate and data source of the UITableView
        articlesTableView.dataSource = self
        articlesTableView.delegate = self
        
        // Get the articles from ArticleModel
        articleModel.delegate = self
        articleModel.getArticles()
        
        // Set the categorySelection options and appearance
        categorySelection.optionArray = categories
        categorySelection.selectedIndex = 0
        categorySelection.rowBackgroundColor = .systemBackground
        categorySelection.arrowColor = .blue
        categorySelection.selectedRowColor = .clear
        
        // Closures for categorySelection
        categorySelection.listWillDisappear {
            // Get articles for new category and reload
            self.categorySelection.didSelect{(selectedText, index, id) in
                // Update category
                self.articleModel.category = selectedText
                
                // Get updated articles
                self.articleModel.getArticles()
            }
        }
        
        // Set the countrySelection options and appearance
        countrySelection.optionArray = countries
        countrySelection.selectedIndex = 0
        countrySelection.rowBackgroundColor = .systemBackground
        countrySelection.arrowColor = .blue
        countrySelection.selectedRowColor = .clear
        
        // Closures
        countrySelection.listWillDisappear {
            // Get articles for new category and reload
            self.countrySelection.didSelect{(country, index, id) in
                // Update category
                self.articleModel.country = country
                
                // Get updated articles
                self.articleModel.getArticles()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Detect indexPath the user has selected
        let indexPath = articlesTableView.indexPathForSelectedRow
        
        guard indexPath != nil else {
            // The user did not select anything
            return
        }
        
        // Get the article user tapped on
        let article = articles[indexPath!.row]
        
        // Get a reference to the detailViewController
        let detailViewController = segue.destination as! DetailViewController
        
        // Pass the article URL to detailViewController
        detailViewController.articleUrl = article.url!
    }
}

// MARK: - ArticleModelProtocol Methods

extension ViewController: ArticleModelProtocol {
    func articlesRetrieved(_ articles: [Article]) {
        // Set the articles property of the view controller using the articles list passed from the model.
        self.articles = articles
        
        // Refresh the tableview to show updated data
        articlesTableView.reloadData()
    }
}


// MARK: - UITableViewDelegate and UITableViewDataSource Methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        // Customize the cell
        cell.displayArticle(articles[indexPath.row])
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // User has just tapped on a row
        // Trigger the segue to go to detail view
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
}

