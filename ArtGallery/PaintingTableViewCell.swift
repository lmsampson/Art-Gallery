//
//  PaintingTableViewCell.swift
//  ArtGallery
//
//  Created by Lisa Sampson on 7/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol PaintingTableViewCellDelegate: class {
    func likeButtonWasTapped(on cell: PaintingTableViewCell)
}

class PaintingTableViewCell: UITableViewCell {
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        delegate?.likeButtonWasTapped(on: self)
    }
    
    private func updateViews() {
        guard let painting = painting else { return }
        
        if painting.isLiked == false {
            likeButton.setTitle("Like", for: .normal)
        } else {
            likeButton.setTitle("Unlike", for: .normal)
        }
        
        artImageView.image = painting.image
    }
    
    var painting: Painting? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: PaintingTableViewCellDelegate?
    
    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
}
