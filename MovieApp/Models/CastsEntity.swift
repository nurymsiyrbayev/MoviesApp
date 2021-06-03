//
//  Cast.swift
//  MovieApp
//
//  Created by ADMIN ODoYal on 03.06.2021.
//

import Foundation

struct CastsEntity: Decodable{
    let cast: [Cast]
    
    struct Cast: Decodable {
        let profilePath: String?
        let name: String?
        let known: String?
        
        enum CodingKeys: String, CodingKey {
            case profilePath = "profile_path"
            case name = "name"
            case known = "known_for_department"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case cast = "cast"
    }
    
}
