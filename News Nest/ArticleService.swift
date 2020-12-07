//
//  ArticleService.swift
//  News Nest
//
//  Created by Neel B Gandhi on 11/25/20.
//  Copyright © 2020 Setu Parekh. All rights reserved.
//

import Foundation

struct ArticleService:Decodable {
    
    var totalResults:Int?
    var articles:[Article]?
}
