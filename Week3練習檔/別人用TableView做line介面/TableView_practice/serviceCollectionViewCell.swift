//
//  serviceCollectionViewCell.swift
//  TableView_practice
//
//  Created by Hsiao-Han Chi on 2022/7/3.
//

import UIKit

class serviceCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "\(serviceCollectionViewCell.self)"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
}
