//
//  Track.swift
//  AlbumsList
//
//  Created by Zamir Thind on 10/23/20.
//  Copyright © 2020 Zamir Thind. All rights reserved.
//

import UIKit

class Track {
    //MARK: Properties
    var song: String
    
    //MARK: Initialization
    
    init?(song: String  ) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if song.isEmpty  {
            return nil
        }
        
        // Initialize stored properties.
        self.song = song
        
    }
    
    func getTrack() ->String  {
        return song
    }
}
