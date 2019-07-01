//
//  ViewController.swift
//  Mathpresso-test
//
//  Created by Thierry Ng on 01/07/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import UIKit
import Alamofire

let endpoint = "https://api.github.com/search/repositories?q=swift"

class RepoListController: UIViewController {

    var tableView: UITableView! {
        didSet {
            self.view.addSubview(tableView)
            tableView.frame = self.view.bounds
            tableView.dataSource = self
            tableView.register(RepoCell.self, forCellReuseIdentifier: "RepoCell")
        }
    }

    var repositories: [Repo] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView()
        Alamofire.request(endpoint)
            .responseJSON { response in
                guard let data = response.data else {
                    print("error fetching list of repos : ")
                    print(response.result.error!)
                    return
                }

                self.decodeJSON(data)
        }
    }

    func decodeJSON(_ jsonData: Data) {
        do {
            let decoder = JSONDecoder()
            let request = try decoder.decode(RepoRequest.self, from: jsonData)

            self.repositories = request.items
            print(self.repositories)
        } catch let error {
            print(error)
        }
    }
}
