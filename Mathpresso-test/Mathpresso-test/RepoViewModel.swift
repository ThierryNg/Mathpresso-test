////
////  RepoViewModel.swift
////  Mathpresso-test
////
////  Created by Thierry Ng on 02/07/2019.
////  Copyright © 2019 Thierry Ng. All rights reserved.
////
//
//import Foundation
//
//protocol ModeratorsViewModelDelegate: class {
//  func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
//  func onFetchFailed(with reason: String)
//}
//
//final class ModeratorsViewModel {
//  private weak var delegate: RepoViewModelDelegate?
//
//  private var repos: [Repo] = []
//  private var currentPage = 1
//  private var total = 0
//  private var isFetchInProgress = false
//
//  var totalCount: Int {
//    return total
//  }
//
//  var currentCount: Int {
//    return repos.count
//  }
//
//  func moderator(at index: Int) -> Repo {
//    return repos[index]
//  }
//
//  func fetchRepos() {
//    // 1
//    guard !isFetchInProgress else {
//      return
//    }
//
//    // 2
//    isFetchInProgress = true
//
//
//
//    client.fetchModerators(with: request, page: currentPage) { result in
//      switch result {
//      // 3
//      case .failure(let error):
//        DispatchQueue.main.async {
//          self.isFetchInProgress = false
//          self.delegate?.onFetchFailed(with: error.reason)
//        }
//      // 4
//      case .success(let response):
//        DispatchQueue.main.async {
//          // 1
//          self.currentPage += 1
//          self.isFetchInProgress = false
//          // 2
//          self.total = response.total
//          self.moderators.append(contentsOf: response.moderators)
//
//          // 3
//          if response.page > 1 {
//            let indexPathsToReload = self.calculateIndexPathsToReload(from: response.moderators)
//            self.delegate?.onFetchCompleted(with: indexPathsToReload)
//          } else {
//            self.delegate?.onFetchCompleted(with: .none)
//          }
//        }
//      }
//    }
//  }
//
//  private func calculateIndexPathsToReload(from newRepos: [Repo]) -> [IndexPath] {
//    let startIndex = repos.count - newRepos.count
//    let endIndex = startIndex + newRepos.count
//    return (startIndex..<endIndex).map { IndexPath(row: 0, section: $0) }
//  }
//
//}
