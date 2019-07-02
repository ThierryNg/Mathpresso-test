//
//  RepoCell.swift
//  Mathpresso-test
//
//  Created by Thierry Ng on 01/07/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import UIKit

class RepoCellOld: UITableViewCell {

    var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 1
        }
    }

    var descriptionLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
        }
    }

    var repositoryImageView: UIImageView! {
        didSet {
            repositoryImageView.clipsToBounds = true
            repositoryImageView.layer.cornerRadius = 22.5
            repositoryImageView.backgroundColor = .yellow
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addChildren()

        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.repositoryImageView)

        self.repositoryImageView.utils_addWidthConstraint(widthConstant: 45)
        self.repositoryImageView.utils_addHeightConstraint(heightConstant: 45)
        self.repositoryImageView.utils_addLeftConstraint(leftConstant: 8)
        self.repositoryImageView.utils_addTopConstraint(topConstant: 8)
        self.repositoryImageView.utils_addBottomConstraint(bottomConstant: 8)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func addChildren() {
        self.titleLabel = UILabel()
        self.descriptionLabel = UILabel()
        self.repositoryImageView = UIImageView()
    }
}
