//
//  Repo.swift
//  Mathpresso-test
//
//  Created by Thierry Ng on 01/07/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import Foundation


struct RepoRequest: Decodable {

    let items: [Repo]

}

struct Repo: Decodable {
    let title: String
    let description: String
    //    let imageURL: String

    private enum CodingKeys: String, CodingKey {
        case title = "name"
        case description = "description"
    }
}
