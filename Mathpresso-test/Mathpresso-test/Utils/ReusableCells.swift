//
//  ReusableCells.swift
//  Mathpresso-test
//
//  Created by Thierry Ng on 02/07/2019.
//  Copyright © 2019 Thierry Ng. All rights reserved.
//

import UIKit

// MARK: -
// MARK: UITableViewCell reusable cells

protocol ReusableCell: class {
    static var reuseIdentifier: String { get }
}

extension ReusableCell where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: type(of: Self()))
    }
}
