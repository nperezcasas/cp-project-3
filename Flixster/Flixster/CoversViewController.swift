//
//  CoversViewController.swift
//  Flixster
//
//  Created by Núria Pérez Casas on 3/13/23.
//

import UIKit
import Nuke

class CoversViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        covers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a collection view cell (based in the identifier you set in storyboard) and cast it to our custom CoverCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoverCell", for: indexPath) as! CoverCell

            // Use the indexPath.item to index into the albums array to get the corresponding album
            let cover = covers[indexPath.item]

            // Get the artwork image url
            let imageUrl = URL(string:"https://image.tmdb.org/t/p/w150" + cover.poster_path.absoluteString)

            // Set the image on the image view of the cell
            Nuke.loadImage(with: imageUrl!, into: cell.coverImageView)

            return cell
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var covers: [Cover] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        // Create a search URL for fetching albums (`entity=album`)
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a7a29b23ea93928463b05f69ce2c0d45")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(CoverSearchResponse.self, from: data)
                let covers = response.results
                DispatchQueue.main.async {
                    self?.covers = covers
                    self?.collectionView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }

        // Initiate the network request
        task.resume()
        
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 4

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 4

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: (width*1.5))


        // Do any additional setup after loading the view.
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
