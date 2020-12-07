//
//  CacheManager.swift
//  News Nest
//
//  Created by Neel B Gandhi on 11/26/20.
//  Copyright © 2020 Setu Parekh. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDict = [String:Data]()
    
    static func saveData(_ url:String, _ image:Data) {
        // Save the imageData with the URL
        imageDict[url] = image
    }
    
    static func getData(_ url:String) -> Data? {
        // Check if the image data exists for URL. Return the data if it exists, else return nil
        return imageDict[url]
    }
}
