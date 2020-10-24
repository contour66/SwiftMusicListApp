//
//  Album.swift
//  AlbumsList
//
//  Created by Zamir Thind on 10/20/20.
//  Copyright © 2020 Zamir Thind. All rights reserved.
//

import UIKit

class Album {
    //MARK: Properties
    var photo: UIImage?
    var album: String
    var artist: String
    var year: String
    var label: String
    var albums: [Album] = []
    var songs: [String?] = []
    //MARK: Initialization
    
    init?(photo: UIImage?,  album: String, artist: String,   year: String, label: String, songs: [String]  ) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if album.isEmpty || artist.isEmpty || year.isEmpty || label.isEmpty  {
            return nil
        }
        
        // Initialize stored properties.
        self.photo = photo
        self.album = album
        self.artist = artist
        self.year = year
        self.label = label
        self.songs = songs

    }
    
    init?(photo: UIImage?,  album: String, artist: String,   year: String, label: String  ) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if album.isEmpty || artist.isEmpty || year.isEmpty || label.isEmpty  {
            return nil
        }
        // Initialize stored properties.
        self.photo = photo
        self.album = album
        self.artist = artist
        self.year = year
        self.label = label

    }
    
    
    
    
    class func createAlbumArray() -> [Album] {
//        let toolPhoto = UIImage(named: "tool")
//        let zepPhoto = UIImage(named: "zep")
//        let mjPhoto = UIImage(named: "mj")
            let pinkPhoto = UIImage(named: "pinkfloyd")
        var albums: [Album] = []
        
        //        let album1 = Album(photo: toolPhoto, album: "Undertow", artist: "Tool", year: "1993", label: "zoo")
        //        let album2 = Album.init(photo: zepPhoto, album: "Led Zepplin II", artist: "Led Zepplin", year: "1969", label: "Zoo" )
        //        let album3 = Album.init(photo: mjPhoto, album: "Off The Wall", artist: "Michael Jackson", year: "1967", label: "atlantic" )
        let album4 = Album.init(photo: pinkPhoto, album: "Animals", artist: "Pink Floyd", year: "1977", label: "Harvest", songs: ["01:24 - Pigs on the Wing (Part 1)",    "17:04 - Dogs",     " 11:28 - Pigs (Three Different Ones)","10:20 - Sheep ", "01:24 - Pigs on the Wing (Part 2) "])
        
        //        albums.append(album1!)
        //        albums.append(album2!)
        //        albums.append(album3!)
        albums.append(album4!)
        return albums
    }
    
}
