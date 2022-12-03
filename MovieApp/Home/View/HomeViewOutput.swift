//
//  HomeHomeViewOutput.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 02/06/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

protocol HomeViewOutput {

    func viewIsReady()
    func openMovieDetails(with id: Int)
    func openMovies(collection: MovieCollections)
}
