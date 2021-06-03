//
//  TrendingMoviesTrendingMoviesInteractorOutput.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import Foundation

protocol TrendingMoviesInteractorOutput: class {
    func setTrendingMovies(_ movies: [MoviesEntity.Movie])
}
