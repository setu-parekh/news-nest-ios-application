//
//  ArticleCell.swift
//  News Nest
//
//  Created by Neel B Gandhi on 11/25/20.
//  Copyright © 2020 Setu Parekh. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    
    var articleToDisplay:Article?
    
    func displayArticle(_ article:Article) {
        
        // Clean up the reused cell before displaying a new article
        articleImage.image = nil
        articleImage.alpha = 0
        headlineLabel.text = ""
        headlineLabel.alpha = 0
        
        // Keep a reference to the article
        articleToDisplay = article
        
        // Set the headline
        headlineLabel.text = articleToDisplay!.title
        
        // Animate the lables into view
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.headlineLabel.alpha = 1
        }, completion: nil)
        
        // Download and display the image
        
        // Create URL String
        guard articleToDisplay!.urlToImage != nil else {
            print("Article has no image!")
            return
        }
        let urlString = articleToDisplay!.urlToImage!
        
        // Check the cache manager if the image is already downloaded
        if let imageData = CacheManager.getData(urlString) {
            // This means image data exists. No need to download again
            articleImage.image = UIImage(data: imageData)
            
            // Animate the article image into view
            UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                self.articleImage.alpha = 1
            }, completion: nil)
            
            return
        }
        
        // Create URL object
        let url = URL(string: urlString)
        
        // Make sure URL object is not nil
        guard url != nil else {
            print("Failed to create URL Object")
            return
        }
        
        // Create URL Session
        let urlSession = URLSession.shared
        
        // Create a Data Task
        let dataTask = urlSession.dataTask(with: url!) { (data, response, error) in
            // Make sure there is no error and data exists
            if data != nil && error == nil {
                
                // Save the image data to cache manager for future use
                CacheManager.saveData(urlString, data!)
                
                // Check the urlString belonging to recently downloaded image matches the article this cell is currently set to display
                if self.articleToDisplay!.urlToImage == urlString {
                    DispatchQueue.main.async {
                        // Display the image data in the articleImage view
                        self.articleImage.image = UIImage(data: data!)
                        
                        // Animate the article image into view
                        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                            self.articleImage.alpha = 1
                        }, completion: nil)
                    }
                }
            }
        }
        
        // Resume the Data Task
        dataTask.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
