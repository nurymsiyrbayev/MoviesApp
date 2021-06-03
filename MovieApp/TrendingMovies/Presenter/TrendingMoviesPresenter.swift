//
//  TrendingMoviesTrendingMoviesPresenter.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

class TrendingMoviesPresenter {

    weak var view: TrendingMoviesViewInput!
    var interactor: TrendingMoviesInteractorInput!
    var router: TrendingMoviesRouterInput!

}

// MARK: TrendingMoviesModuleInput
extension TrendingMoviesPresenter: TrendingMoviesModuleInput {

}

// MARK: TrendingMoviesViewOutput
extension TrendingMoviesPresenter: TrendingMoviesViewOutput {
    func openMovieDetails(with id: Int) {
        router.openMovieDetails(with: id, controller: self.view.getController())
    }
    
    func getTrendingMovies(_ pageNumber: Int) {
        interactor?.getTrendingMovies(pageNumber)
    }
    

    func viewIsReady() {

    }
}

// MARK: TrendingMoviesInteractorOutput
extension TrendingMoviesPresenter: TrendingMoviesInteractorOutput {
    func setTrendingMovies(_ movies: [MoviesEntity.Movie]) {
        view.setTrendingMovies(movies)
    }
}
