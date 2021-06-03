//
//  TrendingMoviesTrendingMoviesViewOutput.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

protocol TrendingMoviesViewOutput {

    /**
        @author nurymsiyrbayev
        Notify presenter that view is ready
    */

    func viewIsReady()
    func fetchMovies(_ pageNumber: Int)
    func openMovieDetails(with id: Int)
}
