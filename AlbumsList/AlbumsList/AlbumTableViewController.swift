//
//  AlbumTableViewController.swift
//  AlbumsList
//
//  Created by Zamir Thind on 10/20/20.
//  Copyright © 2020 Zamir Thind. All rights reserved.
//

import UIKit

class AlbumTableViewController: UITableViewController {
    
    //MARK: Properties
    
    
    var albums: [Album] = []
    var album: Album!
    
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load data
        
        albums = Album.createAlbumArray()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapButton))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func tapButton(){
        addAlbum()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return albums.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MusicList"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MusicList else{
            fatalError("The dequeued cell is not an instance of MusicListViewCell")
        }
        let album = albums[indexPath.row]
        
        
        cell.albumLabel.text = album.album
        cell.artistLabel.text = album.artist
        cell.photoImageView.image = album.photo
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListToDetail"{
            let destVC = segue.destination as! DetailViewController
            destVC.album = sender as? Album
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        album = albums[indexPath.row]
        performSegue(withIdentifier: "ListToDetail", sender: album)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let album = albums[indexPath.row]
        let editAction = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            self.updateAction(album: album, indexPath: indexPath)
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            
            self.deleteAction(album: album, indexPath: indexPath)
            
        }
        deleteAction.backgroundColor = .red
        editAction.backgroundColor = .blue
        return[deleteAction, editAction]
    }
    
    
    private func addAlbum(){
        let alert = UIAlertController(title: "Add", message: "Add an album", preferredStyle: .alert)
       
        
        
        
        //COLLECTS AND STORES ALERT FIELD INPUT
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            guard let albumField = alert.textFields?[0] else{
                return
            }
            guard let artistField = alert.textFields?[1] else{
                return
            }
            guard let yearField = alert.textFields?[2] else{
                return
            }
            guard let recordField = alert.textFields?[3] else{
                return
            }
            
            
            let albumName = albumField.text
            let artistName = artistField.text
            let year = yearField.text
            let labelName = recordField.text
            
            
            
            let mjPhoto = UIImage(named: "mj")
            if(albumName?.count == 0 || artistName?.count == 0 || year?.count == 0 || labelName?.count == 0){
                 let alert = UIAlertController(title: "Whoops!", message: "Fill all fields to add an album", preferredStyle: .alert)
                  let cancelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(cancelAction)
                    self.present(alert,animated: true)
            }else{
                let album = Album(photo: mjPhoto, album: albumName!, artist: artistName!, year: year!, label: labelName!)
                self.albums.append(album!)
                self.insertNewAlbum()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        
        guard let albumField = alert.textFields?[0] else {
            return
        }
        guard let artistField = alert.textFields?[1] else {
            return
        }
        guard let yearField = alert.textFields?[2] else {
            return
        }
        guard let recordField = alert.textFields?[3] else {
            return
        }
        albumField.placeholder = "Add album name"
        artistField.placeholder = "Add artist name"
        yearField.placeholder = "Add release year"
        recordField.placeholder = "Add record label"
      
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
  
    }
    
    func insertNewAlbum(){
        let indexPath = IndexPath(row: albums.count - 1, section:0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    // EDIT ACTION FOR UPDATING AN ALBUM
    private func updateAction(album: Album, indexPath: IndexPath){
        let alert = UIAlertController(title: "Update", message: "Update an album", preferredStyle: .alert)
        
        //COLLECTS AND STORES ALERT FIELD INPUT
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            guard let albumField = alert.textFields?[0] else{
                return
            }
            guard let artistField = alert.textFields?[1] else{
                return
            }
            guard let yearField = alert.textFields?[2] else{
                return
            }
            guard let recordField = alert.textFields?[3] else{
                return
            }
            
            
            
            if let albumToEdit = albumField.text {
                if albumToEdit.count == 0  {
                }else{
                    album.album = albumToEdit
                    
                    self.tableView?.reloadRows(at: [indexPath], with: .automatic)
                    print("New name " + album.album)}
            }
            if let artistToEdit = artistField.text {
                if artistToEdit.count == 0  {
                    
                }else {
                    album.artist = artistToEdit
                    self.tableView?.reloadRows(at: [indexPath], with: .automatic)
                    print("New artist " + album.artist)}
            }
            if let yearToEdit = yearField.text {
                if yearToEdit.count == 0  {
                    
                }else {
                    album.year = yearToEdit
                    self.tableView?.reloadRows(at: [indexPath], with: .automatic)
                    print("New year " + album.year)}
            }
            if let recordToEdit = recordField.text {
                if recordToEdit.count == 0  {
                    
                }else {
                    album.label = recordToEdit
                    self.tableView?.reloadRows(at: [indexPath], with: .automatic)
                    print("New record " + album.label)}
            }
            else{
                return
            }
            
            
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        
        guard let albumField = alert.textFields?[0] else {
            return
        }
        guard let artistField = alert.textFields?[1] else {
            return
        }
        guard let yearField = alert.textFields?[2] else {
            return
        }
        guard let recordField = alert.textFields?[3] else {
            return
        }
        albumField.placeholder = "Change album name"
        artistField.placeholder = " Change artist name"
        yearField.placeholder = " Change album year"
        recordField.placeholder = "Change record label"
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
        
        
    }
    
    private func deleteAction(album: Album, indexPath: IndexPath){
        let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.albums.remove(at:indexPath.row)
            self.tableView?.deleteRows(at: [indexPath], with: .automatic)
        }
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert,animated: true)
        
    }
    
    
    
    
    
}





/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */
