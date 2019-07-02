//
//  ViewController.swift
//  Mathpresso-test
//
//  Created by Thierry Ng on 01/07/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import UIKit
import Alamofire

class RepoListController: UIViewController {

    var networkManager = NetworkManager()

    var tableView: UITableView! {
        didSet {
            self.view.addSubview(tableView)
            tableView.frame = self.view.bounds
            tableView.dataSource = self
            tableView.delegate = self
            tableView.prefetchDataSource = self
            tableView.register(RepoCell.self)
            tableView.allowsSelection = false
            tableView.estimatedRowHeight = 100
            tableView.rowHeight = UITableView.automaticDimension
        }
    }
    var noDataView: UIView = UIView()

    var repositories: [Repo] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView = UITableView()

        self.noDataView.frame = self.view.bounds
        self.noDataView.backgroundColor = .white
        self.view.addSubview(self.noDataView)

        let loadingLabel = UILabel()

        self.noDataView.addSubview(loadingLabel)
        loadingLabel.textAlignment = .center
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.text = "Loading..."

        let labelConstraints = [
            loadingLabel.centerXAnchor.constraint(equalTo: self.noDataView.centerXAnchor),
            loadingLabel.centerYAnchor.constraint(equalTo: self.noDataView.centerYAnchor)
        ]

        NSLayoutConstraint.activate(labelConstraints)

        self.loadListData()
    }

    private func didLoadInitialBatch() {
        self.tableView.reloadData()

        let animator = UIViewPropertyAnimator(duration: 0.6, curve: .easeOut)

        animator.addAnimations {
            self.noDataView.alpha = 0
        }
        animator.addCompletion { position in
            if position == .end {
                self.noDataView.removeFromSuperview()
            }
        }
        animator.startAnimation()
    }

    func loadListData() {
        self.networkManager.fetchRepos { [unowned self] repos, firstPage in
            DispatchQueue.main.async {
                self.repositories += repos
                if firstPage {
                    self.didLoadInitialBatch()
                } else {
                    let indexPathsToReload = self.calculateIndexPathsToReload(from: repos)
                    let visibleRowsToReload = self.visibleIndexPathsToReload(intersecting: indexPathsToReload)

                    self.tableView.reloadRows(at: visibleRowsToReload, with: .fade)
                }
                print("Total of repos : \(self.repositories.count)")
            }
        }
    }

    private func calculateIndexPathsToReload(from newRepos: [Repo]) -> [IndexPath] {
        let startIndex = self.repositories.count - newRepos.count
        let endIndex = startIndex + newRepos.count
        return (startIndex ..< endIndex).map { IndexPath(row: $0, section: 0) }
    }
}
