//
//  DetailViewController.swift
//  AlbumsList
//
//  Created by Zamir Thind on 10/21/20.
//  Copyright © 2020 Zamir Thind. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var table: UITableView!
    var album: Album?
    var songs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        songs = getSongs()
        setUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUI(){
        albumLabel.text = album?.album
        artistLabel.text = album?.artist
        yearLabel.text = album?.year
        recordLabel.text = album?.label
        photoImageView.image = album?.photo
        
    }
    
    func getSongs()->[String]{
        let songs = album?.songs
        for song in songs!{
            print("Track: " + song!)
        }
        return songs! as! [String]
    }
    
    func printSongs(){
        
        for song in songs{
            print("Track s " + song)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "TrackCells"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TrackCells else{
            fatalError("The dequeued cell is not an instance of TrackListCell")
        }
        cell.trackLabel.text = songs[indexPath.row]
        return cell
    }
    

}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


