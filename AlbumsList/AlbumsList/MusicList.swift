//
//  MusicList.swift
//  AlbumsList
//
//  Created by Zamir Thind on 10/20/20.
//  Copyright © 2020 Zamir Thind. All rights reserved.
//

import UIKit

class MusicList: UITableViewCell {
    
//MARK: Properties
    
    @IBOutlet weak var albumLabel: UILabel!
    
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
