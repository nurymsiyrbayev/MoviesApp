//
//  MovieDetailsMovieDetailsInteractorOutput.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import Foundation

protocol MovieDetailsInteractorOutput: class {
    func setMovieDetails(_ movie: MovieDetailsEntity)
    func setMovieCasts(_ casts: [CastsEntity.Cast])
}
