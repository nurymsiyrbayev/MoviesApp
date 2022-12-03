//
//  HomeHomeViewController.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 02/06/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Public
    
    var output: HomeViewOutput!
    
    // MARK: Private
    
    private var todayMovies: [MoviesEntity.Movie] = [MoviesEntity.Movie]() {
        didSet{
            todayCollectionView.reloadData()
        }
    }
    private var soonMovies: [MoviesEntity.Movie] = [MoviesEntity.Movie]() {
        didSet{
            soonCollectionView.reloadData()
        }
    }
    private var trendingMovies: [MoviesEntity.Movie] = [MoviesEntity.Movie]() {
        didSet{
            trendingCollectionView.reloadData()
        }
    }
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var todayCollectionView: UICollectionView!
    @IBOutlet private weak var soonCollectionView: UICollectionView!
    @IBOutlet private weak var trendingCollectionView: UICollectionView!
    
    // MARK: Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        output.viewIsReady()
        configureCollectionsView()
    }
    
    // MARK: IBAction
    
    @IBAction private func openTodayMovies(_ sender: Any) {
        output.openMovies(collection: MovieCollections.Today)
    }
    
    @IBAction private func openSoonMovies(_ sender: Any) {
        output.openMovies(collection: MovieCollections.Soon)
    }
    
    @IBAction private func openTrendingMovies(_ sender: Any) {
        output.openMovies(collection: MovieCollections.Trending)
    }
    
}

// MARK: HomeViewInput

extension HomeViewController: HomeViewInput {
    
    func getController() -> UIViewController {
        return self
    }
    
    func setTrendingMovies(_ movies: [MoviesEntity.Movie]) {
        trendingMovies = movies
    }
    
    func setSoonMovies(_ movies: [MoviesEntity.Movie]) {
        soonMovies = movies
    }
    
    func setTodayMovies(_ movies: [MoviesEntity.Movie]) {
        todayMovies = movies
    }
    
    func setupInitialState() {}
    
}

// MARK: Private func

private extension HomeViewController {
    
    func configureCollectionsView() {
        todayCollectionView.delegate = self
        todayCollectionView.dataSource = self
        todayCollectionView.register(MovieCollectionViewCell.nib, forCellWithReuseIdentifier: MovieCollectionViewCell.idetifier)
        todayCollectionView.showsHorizontalScrollIndicator = false
        
        soonCollectionView.delegate = self
        soonCollectionView.dataSource = self
        soonCollectionView.register(MovieCollectionViewCell.nib, forCellWithReuseIdentifier: MovieCollectionViewCell.idetifier)
        soonCollectionView.showsHorizontalScrollIndicator = false
        
        trendingCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        trendingCollectionView.register(MovieCollectionViewCell.nib, forCellWithReuseIdentifier: MovieCollectionViewCell.idetifier)
        trendingCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func configureNavigationBar() {
        title = "Home"
        navigationItem.backButtonDisplayMode = .minimal
    }
}

// MARK: UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case todayCollectionView:
            output.openMovieDetails(with: todayMovies[indexPath.item].id)
        case soonCollectionView:
            output.openMovieDetails(with: soonMovies[indexPath.item].id)
        case trendingCollectionView:
            output.openMovieDetails(with: trendingMovies[indexPath.item].id)
        default:
            break
        }
    }
}

// MARK: UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case todayCollectionView:
            return todayMovies.count
        case soonCollectionView:
            return soonMovies.count
        case trendingCollectionView:
            return trendingMovies.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case todayCollectionView:
            let cell = todayCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.idetifier, for: indexPath) as! MovieCollectionViewCell
            
            cell.setMovie(todayMovies[indexPath.item])
            
            return cell
            
        case soonCollectionView:
            let cell = soonCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.idetifier, for: indexPath) as! MovieCollectionViewCell
            
            cell.setMovie(soonMovies[indexPath.item])
            
            return cell
            
        case trendingCollectionView:
            let cell = trendingCollectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.idetifier, for: indexPath) as! MovieCollectionViewCell
            
            cell.setMovie(trendingMovies[indexPath.item])
            
            return cell
            
        default:
            return UICollectionViewCell()
            
        }
    }
}
