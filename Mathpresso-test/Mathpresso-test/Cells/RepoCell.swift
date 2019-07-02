//
//  RepoCell.swift
//  Mathpresso-test
//
//  Created by Thierry Ng on 02/07/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import UIKit
import SDWebImage

class RepoCell: UITableViewCell {

    private var data: Repo? {
        didSet {
            self.titleLabel.text = data?.title ?? "Loading..."
            self.descriptionLabel.text = data?.description
            self.ownerImageView.sd_setImage(with: data?.owner.avatarURL, completed: nil)
        }
    }

    @IBOutlet weak var ownerImageView: UIImageView! {
        didSet {
            ownerImageView.clipsToBounds = true
            ownerImageView.layer.cornerRadius = 22.5
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            titleLabel.numberOfLines = 1
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textColor = .lightGray
        }
    }

    func configure(with repo: Repo?) {
        self.ownerImageView.sd_cancelCurrentImageLoad()
        self.ownerImageView.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
        self.data = repo
    }
}

extension RepoCell: ReusableCell {}
