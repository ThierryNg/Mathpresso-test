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
    let totalCount: Int

    private enum CodingKeys: String, CodingKey {
        case items = "items"
        case totalCount = "total_count"
    }
}

struct Repo: Decodable {
    let title: String?
    let description: String?
    let owner: Owner

    private enum CodingKeys: String, CodingKey {
        case title = "name"
        case description = "description"
        case owner = "owner"
    }

    struct Owner: Decodable {
        let avatarURL: URL

        private enum CodingKeys: String, CodingKey {
            case avatarURL = "avatar_url"
        }
    }
}
