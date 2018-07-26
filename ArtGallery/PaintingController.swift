//
//  PaintingController.swift
//  ArtGallery
//
//  Created by Lisa Sampson on 7/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PaintingController {
    
    func loadPaintingFromAssets() {
        for number in 1...12 {
            let string = "Image\(number)"
            guard let image = UIImage(named: string) else { continue }
            let painting = Painting(image: image)
            paintings.append(painting)
        }
    }
    
    func toggleIsLiked(for painting: Painting) {
        if painting.isLiked == false {
            painting.isLiked = true
        } else {
            painting.isLiked = false
        }
    }
    
    init() {
        loadPaintingFromAssets()
    }
    
    private(set) var paintings: [Painting] = []
}



