//
//  File.swift
//  Mathpresso-test
//
//  Created by Thierry Ng on 01/07/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {

    var currentCount = 1
    var inProgress = false
    var totalCount = 0

    func fetchRepos(completion: @escaping ([Repo], Bool)-> Void) {
        guard self.inProgress == false else {
            return
        }
        self.inProgress = true
        print("[DEBUG] Fetching page \(self.currentCount) ...")

        let params: Parameters = [
            "q" : "language:swift",
            "page" : self.currentCount,
            "per_page" : 100
        ]

        Alamofire.request(endpoint, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                guard let data = response.data else {
                    print("error fetching list of repos : ")
                    print(response.result.error!)
                    return
                }

                guard let repos = self.decodeJSON(data) else {
                    print("no more data")
                    return
                }
                let isFirstPage = self.currentCount == 1

                self.currentCount += 1
                self.inProgress = false
                completion(repos, isFirstPage)
        }
    }

    func decodeJSON(_ jsonData: Data) -> [Repo]? {
        do {
            let decoder = JSONDecoder()
            let request = try decoder.decode(RepoRequest.self, from: jsonData)

            print("Got \(request.items.count) results, first title: \(request.items.first?.title ?? "Woops")")
            if self.totalCount == 0 {
                self.totalCount = request.totalCount
            }
            return request.items
        } catch let error {
            print(error)
            return nil
        }
    }
}
