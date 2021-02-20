//
//  DetailViewController.swift
//  Landmark Book
//
//  Created by Simon Wilson on 20/02/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var image = UIImage()
    var placetitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        
        label.text = placetitle
    }

}
