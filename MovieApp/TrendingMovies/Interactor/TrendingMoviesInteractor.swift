//
//  TrendingMoviesTrendingMoviesInteractor.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//
import Foundation

class TrendingMoviesInteractor {

    // MARK: Public
    
    weak var output: TrendingMoviesInteractorOutput!
}

// MARK: TrendingMoviesInteractorInput

extension TrendingMoviesInteractor: TrendingMoviesInteractorInput {
    
    func fetchMovies(_ pageNumber: Int, collection: MovieCollections) {
        
        var urlComponents: URLComponents?
        switch collection {
        case MovieCollections.Today:
            urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/now_playing")
        case MovieCollections.Soon:
            urlComponents = URLComponents(string:  "https://api.themoviedb.org/3/movie/upcoming")
        case MovieCollections.Trending:
            urlComponents = URLComponents(string: "https://api.themoviedb.org/3/trending/movie/week")
        }
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "00133da9de6d883e708e1c2aee13de35"),
            URLQueryItem(name: "page", value: String(pageNumber))
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if error == nil {
                    guard let data = data else {return}
                    DispatchQueue.global().async {
                        do {
                                let movies = try JSONDecoder().decode(MoviesEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self?.output.setMovies(movies.results)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
}
