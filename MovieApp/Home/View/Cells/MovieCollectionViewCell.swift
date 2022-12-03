//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by ADMIN ODoYal on 02.06.2021.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    // MARK: Public
    
    static let idetifier: String = "MovieCollectionViewCell"
    static let nib: UINib = UINib(nibName: idetifier, bundle: Bundle(for: MovieCollectionViewCell.self))
    
    // MARK: Private
    
    private var movie: MoviesEntity.Movie?{
        didSet{
            if let movie = movie {
                configureLayout()
                let posterURL = URL(string: "https://image.tmdb.org/t/p/w500" + (movie.poster ?? ""))
                posterImageView.kf.setImage(with: posterURL)
                ratingLabel.text = String(movie.rating ?? 0)
                titleLabel.text = movie.title
                genreLabel.text = movie.releaseDate
            }
        }
    }
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var ratingView: UIView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: Life Cicle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: Public func

extension MovieCollectionViewCell {
    
    public func setMovie(_ movie: MoviesEntity.Movie){
        self.movie = movie
    }
}

// MARK: Private func

private extension MovieCollectionViewCell {
    
    func configureLayout() {
        configureRatingContainerView()
        configurePosterImageView()
    }
    
    func configurePosterImageView() {
        posterImageView.layer.cornerRadius = 12
    }
    
    func configureRatingContainerView() {
        ratingView.layer.cornerRadius = ratingView.layer.bounds.height / 2
        ratingView.backgroundColor =  getColorByReting(movie?.rating ?? 0)
        
        func getColorByReting(_ rating: Double) -> UIColor {
            switch rating {
            case 0..<5:
                return UIColor.systemRed
            case 5..<7:
                return UIColor.systemYellow
            case 7...10:
                return UIColor.systemGreen
            default:
                return UIColor.systemGray4
            }
        }
    }
}
