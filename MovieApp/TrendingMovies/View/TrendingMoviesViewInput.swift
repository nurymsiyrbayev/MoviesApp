//
//  TrendingMoviesTrendingMoviesViewInput.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//
import UIKit
protocol TrendingMoviesViewInput: class {

    /**
        @author nurymsiyrbayev
        Setup initial state of the view
    */

    func setupInitialState()
    func setTrendingMovies(_ movies: [MoviesEntity.Movie])
    func getController() -> UIViewController
}
