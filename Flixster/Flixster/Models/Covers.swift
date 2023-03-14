//
//  Covers.swift
//  Flixster
//
//  Created by Núria Pérez Casas on 3/13/23.
//

import Foundation
import Nuke


struct CoverSearchResponse: Decodable {
    let results: [Cover]
}

struct Cover: Decodable {
    let poster_path: URL
}
