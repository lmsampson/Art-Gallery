//
//  PaintingListViewController.swift
//  ArtGallery
//
//  Created by Lisa Sampson on 7/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PaintingListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PaintingTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintingTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintingController.paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtCell", for: indexPath)
        guard let artCell = cell as? PaintingTableViewCell else { return cell }
        
        let painting = paintingController.paintings[indexPath.row]
        artCell.painting = painting
        artCell.delegate = self
        
        return artCell
    }
    
    func likeButtonWasTapped(on cell: PaintingTableViewCell) {
        
        guard let indexPath = paintingTableView.indexPath(for: cell) else { return }
        guard let painting = cell.painting else { return }
        
        paintingController.toggleIsLiked(for: painting)
        
        paintingTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        
    }
    
    let paintingController = PaintingController()
    
    @IBOutlet weak var paintingTableView: UITableView!
}
