//
//  DetailViewController.swift
//  Flixster
//
//  Created by Núria Pérez Casas on 3/6/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    var movie: Movie!

    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailVotesLabel: UILabel!
    @IBOutlet weak var detailPopularityLabel: UILabel!
    @IBOutlet weak var detailOverviewLabel: UILabel!
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailVoteAvgLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Load the image located at the `artworkUrl100` URL and set it on the image view.
        Nuke.loadImage(with: movie.backdrop_path, into: detailImage)
        //let baseURL = URL(string: "https://image.tmdb.org/t/p/w150")
//        let imageURL = URL(string: movie.backdrop_path.absoluteString, relativeTo: baseURL)!
//        Nuke.loadImage(with: imageURL, into: detailImage)
            // Set labels with the associated movie values.
        detailTitleLabel.text = movie.title
        detailVotesLabel.text = String(movie.vote_count) + " Votes"
        detailVoteAvgLabel.text = String(movie.vote_average) + " Vote Avg."
        detailPopularityLabel.text = String(movie.popularity) + " Popularity"
        detailOverviewLabel.text = movie.overview
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

