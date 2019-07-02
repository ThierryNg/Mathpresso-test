//
//  RepoTableViewProtocols.swift
//  Mathpresso-test
//
//  Created by Thierry Ng on 01/07/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import UIKit

extension RepoListController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.networkManager.totalCount
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepoCell = tableView.dequeueReusableCell(forIndexPath: indexPath)

        if indexPath.row >= self.repositories.count {
            cell.configure(with: nil)
        } else {
            cell.configure(with: self.repositories[indexPath.row])
        }
        return cell
    }
}

extension RepoListController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: { $0.row >= self.repositories.count }) {
            self.loadListData()
        }
    }

    func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
        let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows ?? []
        let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
        return Array(indexPathsIntersection)
    }
}
