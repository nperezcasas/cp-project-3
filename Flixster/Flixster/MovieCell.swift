//
//  MovieCell.swift
//  Flixster
//
//  Created by Núria Pérez Casas on 3/3/23.
//

import UIKit
import Nuke

//import ViewController.h

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var poster_pathImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie) {
        
        if titleLabel?.text == nil {
            print("not a valid name")
        }
        else{
            titleLabel.text = movie.title
        }
        //titleLabel.text = movie.title
        
        if overviewLabel?.text == nil {
            print("not a valid overview")
        }
        else{
            overviewLabel.text = movie.overview
        }

        // Load image async via Nuke library image loading helper method
        
        Nuke.loadImage(with: movie.poster_path, into: poster_pathImage)
        //Nuke.loadImage(with: movie.poster_path, into: poster_pathImage)
    }

}
