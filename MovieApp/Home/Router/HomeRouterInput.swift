//
//  HomeHomeRouterInput.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 02/06/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import UIKit

protocol HomeRouterInput {
    
    func openMovieDetails(with id: Int, controller: UIViewController)
    func openMovies(collection: MovieCollections, controller: UIViewController)
}
