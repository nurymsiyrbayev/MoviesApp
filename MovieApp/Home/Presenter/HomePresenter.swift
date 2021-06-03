//
//  HomeHomePresenter.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 02/06/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

class HomePresenter {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

}

// MARK: HomeModuleInput
extension HomePresenter: HomeModuleInput {

}

// MARK: HomeViewOutput
extension HomePresenter: HomeViewOutput {
    func openMovies(collection: MovieCollections) {
        router.openMovies(collection: collection, controller: view.getController())
    }
    
    func openMovieDetails(with id: Int) {
        router.openMovieDetails(with: id, controller: self.view.getController())
    }
    

    func viewIsReady() {
        interactor.fetchTrendingMovies()
        interactor.fetchTodayMovies()
        interactor.fetchSoonMovies()
    }
}

// MARK: HomeInteractorOutput
extension HomePresenter: HomeInteractorOutput {
    func setTrendingMovies(_ movies: [MoviesEntity.Movie]) {
        view.setTrendingMovies(movies)
    }
    
    func setSoonMovies(_ movies: [MoviesEntity.Movie]) {
        view.setSoonMovies(movies)
    }
    
    func setTodayMovies(_ movies: [MoviesEntity.Movie]) {
        view.setTodayMovies(movies)
    }
}
