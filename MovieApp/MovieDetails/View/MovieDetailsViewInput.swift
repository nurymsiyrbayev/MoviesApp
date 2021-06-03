//
//  MovieDetailsMovieDetailsViewInput.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

protocol MovieDetailsViewInput: class {

    func setupInitialState()
    func setMovieDetails(_ movieDetails: MovieDetailsEntity)
    func setMovieCasts(_ casts: [CastsEntity.Cast])
}
