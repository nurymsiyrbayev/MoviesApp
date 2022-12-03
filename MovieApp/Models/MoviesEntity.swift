//
//  TrendingMovieEntity.swift
//  MovieApp
//
//  Created by ADMIN ODoYal on 30.05.2021.
//

import Foundation

struct MoviesEntity: Decodable {
    let results: [Movie]
    
    struct Movie: Decodable {
        
        let id: Int
        let poster: String?
        let backdrop: String?
        let title: String?
        let releaseDate: String?
        let rating: Double?
        let overview: String?
        let genreIds: [Int]
        
        enum CodingKeys: String, CodingKey {
            case id
            case poster = "poster_path"
            case title = "title"
            case releaseDate = "release_date"
            case rating = "vote_average"
            case backdrop = "backdrop_path"
            case overview = "overview"
            case genreIds = "genre_ids"
        }
    }
}
