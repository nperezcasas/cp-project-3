//
//  Movie.swift
//  Flixster
//
//  Created by Núria Pérez Casas on 3/3/23.
//

import Foundation

struct MoviesResponse: Decodable {
    let results: [Movie]
}

// TODO: Pt 1 - Create a Movie model struct

struct Movie : Decodable{
    let backdrop_path: URL
    let overview: String
    let popularity: Float
    let poster_path: URL
    let title: String
    let vote_average: Float
    let vote_count: Int
}

    // We can now access this array of mock tracks anywhere like this:
    // let tracks = Tracks.mockTracks
