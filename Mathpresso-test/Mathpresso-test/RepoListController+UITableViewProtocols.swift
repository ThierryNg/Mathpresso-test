//
//  RepoTableViewProtocols.swift
//  Mathpresso-test
//
//  Created by Thierry Ng on 01/07/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import UIKit

extension RepoListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as? RepoCell else {
            return UITableViewCell()
        }

        return cell
    }
}
