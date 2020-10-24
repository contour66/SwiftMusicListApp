//
//  DetailViewController.swift
//  AlbumsList
//
//  Created by Zamir Thind on 10/21/20.
//  Copyright © 2020 Zamir Thind. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func addButtonTapped(_ sender: Any) {
        insertNewTrack()
    }
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var addSongTextField: UITextField!
    
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
    
    func insertNewTrack() {
        songs.append(addSongTextField.text!)
        album?.songs.append(addSongTextField.text!)
        let indexPath = IndexPath(row: songs.count - 1, section: 0)
        table.beginUpdates()
        table.insertRows(at: [indexPath], with: .automatic)
        table.endUpdates()
        addSongTextField.text = ""
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            songs.remove(at: indexPath.row)
            table.beginUpdates()
            table.deleteRows(at: [indexPath], with: .automatic)
            
            table.endUpdates()
        }
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


