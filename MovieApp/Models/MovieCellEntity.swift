//
//  MovieCellEntity.swift
//  MovieApp
//
//  Created by Nurym Siyrbayev on 03.12.2022.
//

import Foundation

struct MovieCellEntity {
    let id: Int
    let poster: String?
    let backdrop: String?
    let title: String?
    let releaseDate: String?
    let rating: Double?
    let overview: String?
    let genres: [GenreEntities.Genre]
    
    init(movie: MoviesEntity.Movie, genres: [GenreEntities.Genre]) {
        id = movie.id
        poster = movie.poster
        backdrop = movie.backdrop
        title = movie.title
        releaseDate = movie.releaseDate
        rating = movie.rating
        overview = movie.overview
        self.genres = genres
    }
}
