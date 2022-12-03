//
//  TrendingMoviesTrendingMoviesViewController.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import UIKit

class TrendingMoviesViewController: UIViewController {
    
    // MARK: Public
    
    var output: TrendingMoviesViewOutput!
    
    // MARK: Private
    
    private var pageNumber: Int = 1
    private var isLoading: Bool = false
    private var movies: [MoviesEntity.Movie] = [MoviesEntity.Movie]() {
        didSet{
            isLoading = false
            tableView.reloadData()
        }
    }
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        output.fetchMovies(pageNumber)
        navigationItem.backButtonDisplayMode = .minimal
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

// MARK: TrendingMoviesViewInput

extension TrendingMoviesViewController: TrendingMoviesViewInput {
    
    func setNavigationTitle(_ title: String) {
        self.title = title
    }
    
    func setMovies(_ movies: [MoviesEntity.Movie]) {
        self.movies = movies
    }
    
    func getController() -> UIViewController {
        return self
    }
    
    func setTrendingMovies(_ movies: [MoviesEntity.Movie]) {
        self.movies += movies
    }
    
    func setupInitialState() {}
}

// MARK: Private func

private extension TrendingMoviesViewController {
    
    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TrendingMoviesTableViewCell.nib, forCellReuseIdentifier: TrendingMoviesTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: UITableViewDelegate

extension TrendingMoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.openMovieDetails(with: movies[indexPath.row].id)
    }
}

// MARK: UITableViewDataSource

extension TrendingMoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendingMoviesTableViewCell.identifier, for: indexPath) as! TrendingMoviesTableViewCell
        
        cell.setMovie(movies[indexPath.row])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maxOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffSet = maxOffset - currentOffset
        
        if deltaOffSet <= 10 && currentOffset > 200 && !isLoading {
            isLoading = true
            pageNumber += 1
            output.fetchMovies(pageNumber)
        }
    }
}
