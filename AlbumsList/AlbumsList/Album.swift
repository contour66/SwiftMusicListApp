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
        let toolPhoto = UIImage(named: "tool")
        let zepPhoto = UIImage(named: "zep")
        let mjPhoto = UIImage(named: "mj")
        let pinkPhoto = UIImage(named: "pinkfloyd")
        let milesPhoto = UIImage(named: "miles")
        let eminemPhoto = UIImage(named: "eminem")
        let nofxPhoto = UIImage(named: "nofx")
        let brunoPhoto = UIImage(named: "bruno")
        let jamiroquaiPhoto = UIImage(named: "jamiroquai")
        let adelePhoto = UIImage(named: "adele")
        
        var albums: [Album] = []
        
        let album1 = Album(photo: toolPhoto, album: "Undertow", artist: "Tool", year: "1993", label: "Zoo", songs: [    "05:42 - Undertow",    "05:10 - Sober",     "05:20 - Opiate"])
        let album2 = Album.init(photo: zepPhoto, album: "Led Zepplin II", artist: "Led Zepplin", year: "1969", label: "Zoo", songs: [    "05:38 - Whole Lotta Love",    "04:33 - Thank You",     "04:24 - Heartbreaker" ] )
        let album3 = Album.init(photo: mjPhoto, album: "Off The Wall", artist: "Michael Jackson", year: "1967", label: "Epic", songs: ["6:02 - Don't Stop 'Til You Get Enough",    "03:38 - Rock with You" ] )
        let album4 = Album.init(photo: pinkPhoto, album: "Animals", artist: "Pink Floyd", year: "1977", label: "Harvest", songs: ["01:24 - Pigs on the Wing (Part 1)",    "17:04 - Dogs",     " 11:28 - Pigs (Three Different Ones)","10:20 - Sheep ", "01:24 - Pigs on the Wing (Part 2) "])
        let album5 = Album.init(photo: nofxPhoto, album: "Punk In Drublic", artist: "NOFX", year: "1994", label: "Epitaph", songs: ["02:10 - Lineoleum", "02:16 - Dig", "01:37 - The Cause"])
        let album6 = Album.init(photo: milesPhoto, album: "Kind of Blue", artist: "Miles Davis", year: "1959", label: "Columbia", songs: ["09:04  - So What"])
        let album7 = Album.init(photo: eminemPhoto, album: "The Eminem Show", artist: "Eminem", year: "2002", label: "Aftermath", songs: [    "04:57 - Cleanin' Out My Closet"])
        let album8 = Album.init(photo: adelePhoto, album: "19", artist: "Adele", year: "2008", label: "Columbia", songs: ["04:19 - Best for Last"])
        let album9 = Album.init(photo: brunoPhoto, album: "24K Magic ", artist: "Bruno Mars", year: "2016", label: "Columbia", songs: ["09:04  - 24k Magic"])
        let album10 = Album.init(photo: jamiroquaiPhoto, album: "Traveling Without Moving", artist: "Miles Davis", year: "1996", label: "Columbia", songs: ["05:40  - Virtual Insanity"])
        
        albums.append(album4!)
        albums.append(album1!)
        albums.append(album2!)
        albums.append(album3!)
        albums.append(album5!)
        albums.append(album6!)
        albums.append(album7!)
        albums.append(album8!)
        albums.append(album9!)
        albums.append(album10!)
        
        return albums
    }
    
}
