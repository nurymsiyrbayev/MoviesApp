//
//  TrendingMoviesTrendingMoviesViewInput.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//
import UIKit
protocol TrendingMoviesViewInput: AnyObject {

    func setupInitialState()
    func setNavigationTitle(_ title: String)
    func setMovies(_ movies: [MoviesEntity.Movie])
    func getController() -> UIViewController
}
