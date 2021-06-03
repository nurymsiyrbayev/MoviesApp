//
//  MovieDetailsMovieDetailsPresenter.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

class MovieDetailsPresenter {
    private var movieId: Int
    weak var view: MovieDetailsViewInput!
    var interactor: MovieDetailsInteractorInput!
    var router: MovieDetailsRouterInput!
    
    init(movieId: Int) {
        self.movieId = movieId
    }
}

// MARK: MovieDetailsModuleInput
extension MovieDetailsPresenter: MovieDetailsModuleInput {

}

// MARK: MovieDetailsViewOutput
extension MovieDetailsPresenter: MovieDetailsViewOutput {

  func viewIsReady() {
    self.interactor.fetchMovieDetails(with: movieId)
    self.interactor.fetchMovieCasts(with: movieId)
    }
}

// MARK: MovieDetailsInteractorOutput
extension MovieDetailsPresenter: MovieDetailsInteractorOutput {
    func setMovieCasts(_ casts: [CastsEntity.Cast]) {
        view.setMovieCasts(casts)
    }
    
    func setMovieDetails(_ movie: MovieDetailsEntity) {
        view.setMovieDetails(movie)
    }
   
}
