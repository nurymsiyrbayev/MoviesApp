//
//  TrendingMoviesTableViewCell.swift
//  MovieApp
//
//  Created by ADMIN ODoYal on 30.05.2021.
//

import Foundation
import UIKit
import Kingfisher

class TrendingMoviesTableViewCell: UITableViewCell {
    public static let identifier: String = "TrendingMoviesTableViewCell"
    public static let nib = UINib(nibName: identifier, bundle: Bundle(for: TrendingMoviesTableViewCell.self))
    
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var ratingContainerView: UIView!
    @IBOutlet private var ratingLabel: UILabel!
    @IBOutlet private var movieTitleLabel: UILabel!
    @IBOutlet private var releaseDateLabel: UILabel!
    
    private var movie: MoviesEntity.Movie?{
        didSet {
            if let movie = movie {
                configureLayout()
                let posterURL = URL(string: "https://image.tmdb.org/t/p/w500" + (movie.poster ?? ""))
                posterImageView.kf.setImage(with: posterURL)
                ratingLabel.text = String(movie.rating ?? 0)
                movieTitleLabel.text = movie.title
                releaseDateLabel.text = movie.releaseDate
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

// MARK: Public func
extension TrendingMoviesTableViewCell {
    public func setMovie(_ movie: MoviesEntity.Movie) {
        self.movie = movie
    }
}

// MARK: Private func
private extension TrendingMoviesTableViewCell {
    func configureLayout() {
        configureRatingContainerView()
        configurePosterImageView()
    }
    
    func configurePosterImageView() {
        posterImageView.layer.cornerRadius = 12
    }
    
    func configureRatingContainerView() {
        ratingContainerView.layer.cornerRadius = ratingContainerView.layer.bounds.height / 2
        ratingContainerView.backgroundColor =  getColorByReting(movie?.rating ?? 0)
        
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
