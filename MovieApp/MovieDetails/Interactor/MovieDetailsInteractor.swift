//
//  MovieDetailsMovieDetailsInteractor.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//
import Foundation

class MovieDetailsInteractor {

    weak var output: MovieDetailsInteractorOutput!

}

// MARK: MovieDetailsInteractorInput
extension MovieDetailsInteractor: MovieDetailsInteractorInput {
    
    func fetchMovieCasts(with id: Int) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/\(id)/credits")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "00133da9de6d883e708e1c2aee13de35")
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if error == nil {
                    guard let data = data else {return}
                    DispatchQueue.global().async {
                        do {
                            let castsEntity = try JSONDecoder().decode(CastsEntity.self, from: data)
                            DispatchQueue.main.async {
                                var casts: [CastsEntity.Cast] = []
                                for i in 1...3{
                                    casts.append(castsEntity.cast[i])
                                }
                                self?.output.setMovieCasts(casts)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
    
    func fetchMovieDetails(with id: Int) {
        var urlComponents = URLComponents(string: "https://api.themoviedb.org/3/movie/\(id)")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "00133da9de6d883e708e1c2aee13de35")
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if error == nil {
                    guard let data = data else {return}
                    DispatchQueue.global().async {
                        do {
                            let movieDetails = try JSONDecoder().decode(MovieDetailsEntity.self, from: data)
                            DispatchQueue.main.async {
                                self?.output.setMovieDetails(movieDetails)
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
