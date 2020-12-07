//
//  Article.swift
//  News Nest
//
//  Created by Setu Parekh on 11/25/20.
//  Copyright © 2020 Setu Parekh. All rights reserved.
//

import Foundation

struct Article:Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
}
