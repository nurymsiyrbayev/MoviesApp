//
//  MovieDetailsMovieDetailsViewController.swift
//  MovieApp
//
//  Created by nurymsiyrbayev on 30/05/2021.
//  Copyright © 2021 Nurym IOS Dev. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {
    
    // MARK: Public
    
    var output: MovieDetailsViewOutput!
    
    // MARK: Private
    
    private var movie: MovieDetailsEntity? {
        didSet{
            if let movie = movie {
                title = movie.title
                let posterURL = URL(string: "https://image.tmdb.org/t/p/w500" + (movie.backdrop ?? ""))
                posterImageView.kf.setImage(with: posterURL)
                titleLabel.text = movie.title
                releaseDateLabel.text = movie.releaseDate
                descriptionLabel.text = movie.overview
            }
        }
    }
    
    private var movieCasts: [CastsEntity.Cast] = [CastsEntity.Cast]() {
        didSet {
            castsCollectionView.reloadData()
        }
        
    }
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var castsCollectionView: UICollectionView!
    
    // MARK: Lifee Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        configureCollectionView()
        navigationItem.backButtonDisplayMode = .minimal
    }
}

// MARK: MovieDetailsViewInput

extension MovieDetailsViewController: MovieDetailsViewInput {
    
    func setMovieCasts(_ casts: [CastsEntity.Cast]) {
        movieCasts = casts
    }
    
    func setMovieDetails(_ movieDetails: MovieDetailsEntity) {
        movie = movieDetails
    }
    
    
    func setupInitialState() {}
}

// MARK: Privte func

private extension MovieDetailsViewController {
    
    func configureCollectionView(){
        castsCollectionView.dataSource = self
        castsCollectionView.delegate = self
        castsCollectionView.register(CastCollectionViewCell.nib, forCellWithReuseIdentifier: CastCollectionViewCell.identifier)
    }
}

// MARK: UICollectionViewDelegate

extension MovieDetailsViewController: UICollectionViewDelegate {}

// MARK: UICollectionViewDataSource

extension MovieDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieCasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = castsCollectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.identifier, for: indexPath) as! CastCollectionViewCell
        cell.setCast(movieCasts[indexPath.item])
        return cell
    }
}

