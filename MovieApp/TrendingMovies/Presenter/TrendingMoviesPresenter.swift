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
    let movieCollection: MovieCollections
    
    init(colection: MovieCollections) {
        self.movieCollection = colection
    }
}

// MARK: TrendingMoviesModuleInput
extension TrendingMoviesPresenter: TrendingMoviesModuleInput {

}

// MARK: TrendingMoviesViewOutput
extension TrendingMoviesPresenter: TrendingMoviesViewOutput {
    func openMovieDetails(with id: Int) {
        router.openMovieDetails(with: id, controller: self.view.getController())
    }
    
    func fetchMovies(_ pageNumber: Int) {
        interactor?.fetchMovies(pageNumber, collection: movieCollection)
    }
    

    func viewIsReady() {

    }
}

// MARK: TrendingMoviesInteractorOutput
extension TrendingMoviesPresenter: TrendingMoviesInteractorOutput {
    
    func setMovies(_ movies: [MoviesEntity.Movie]) {
        view.setMovies(movies)
        view.setNavigationTitle(movieCollection.rawValue)
    }
}
