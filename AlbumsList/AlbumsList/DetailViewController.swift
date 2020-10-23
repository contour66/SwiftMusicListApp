//
//  DetailViewController.swift
//  AlbumsList
//
//  Created by Zamir Thind on 10/21/20.
//  Copyright © 2020 Zamir Thind. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    var album: Album?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
