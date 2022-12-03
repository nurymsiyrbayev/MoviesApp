//
//  MovieDetailsMovieDetailsInteractorInput.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import Foundation

protocol MovieDetailsInteractorInput {
    
    func fetchMovieDetails(with id: Int)
    func fetchMovieCasts(with id: Int)
}
