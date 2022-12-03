//
//  HomeHomeInteractor.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 02/06/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//
import Foundation

class HomeInteractor {
    
    // MARK: Public
    
    weak var output: HomeInteractorOutput!
    
    // MARK: Private
    
    private let api_key = "00133da9de6d883e708e1c2aee13de35"
}

// MARK: HomeInteractorInput

extension HomeInteractor: HomeInteractorInput {
    
    func fetchTrendingMovies() {
        var urlComponents = URLComponents(string:  "https://api.themoviedb.org/3/trending/movie/week")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: "00133da9de6d883e708e1c2aee13de35")
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if error == nil {
                    guard let data = data else {return}
                    DispatchQueue.global().async {
                        do {
                            let trendingMovies = try JSONDecoder().decode(MoviesEntity.self, from: data)
                            DispatchQueue.main.async {
                                self?.output.setTrendingMovies(trendingMovies.results)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
    
    func fetchSoonMovies() {
        var urlComponents = URLComponents(string:  "https://api.themoviedb.org/3/movie/upcoming")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: api_key)
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if error == nil {
                    guard let data = data else {return}
                    DispatchQueue.global().async {
                        do {
                            let soonMovies = try JSONDecoder().decode(MoviesEntity.self, from: data)
                            DispatchQueue.main.async {
                                self?.output.setSoonMovies(soonMovies.results)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
        
    }
    
    func fetchTodayMovies() {
        var urlComponents = URLComponents(string:  "https://api.themoviedb.org/3/movie/now_playing")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: api_key)
        ]
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if error == nil {
                    guard let data = data else {return}
                    DispatchQueue.global().async {
                        do {
                            let todayMovies = try JSONDecoder().decode(MoviesEntity.self, from: data)
                            DispatchQueue.main.async {
                                self?.output.setTodayMovies(todayMovies.results)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
    
    private func fetchMoviesGenre(ids:[Int]) -> [GenreEntities.Genre]? {
        var genres: [GenreEntities.Genre]?
        var urlComponents = URLComponents(string:  "https://api.themoviedb.org/3/genre/movie/list")
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: api_key)
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil {
                    guard let data = data else {return}
                    DispatchQueue.global().async {
                        do {
                            let decodedGenres = try JSONDecoder().decode(GenreEntities.self, from: data)
                            DispatchQueue.main.async {
                                genres = decodedGenres.genres
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
        return genres
    }
}
