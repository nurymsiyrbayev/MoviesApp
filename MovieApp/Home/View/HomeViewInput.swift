//
//  HomeHomeViewInput.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 02/06/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//
import UIKit

protocol HomeViewInput: class {

    func setupInitialState()
    
    func setTrendingMovies(_ movies: [MoviesEntity.Movie])
    func setSoonMovies(_ movies: [MoviesEntity.Movie])
    func setTodayMovies(_ movies: [MoviesEntity.Movie])
    
    func getController() -> UIViewController
}
