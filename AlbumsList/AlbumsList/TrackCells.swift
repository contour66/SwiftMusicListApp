//
//  TrackCells.swift
//  AlbumsList
//
//  Created by Zamir Thind on 10/23/20.
//  Copyright © 2020 Zamir Thind. All rights reserved.
//


import UIKit

class TrackCells: UITableViewCell {
    
    //MARK: Properties
    
   
    @IBOutlet weak var trackLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
