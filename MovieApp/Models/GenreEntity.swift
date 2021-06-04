//
//  GenreEntity.swift
//  MovieApp
//
//  Created by ADMIN ODoYal on 04.06.2021.
//

import Foundation

struct GenreEntities: Decodable {
    let genres: [Genre]
    
    struct Genre: Decodable {
        let id: Int
        let name: String
    }
    
}
