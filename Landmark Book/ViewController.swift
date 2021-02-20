//
//  ViewController.swift
//  Landmark Book
//
//  Created by Simon Wilson on 20/02/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var chosenLandMarkName = ""
    
    var chosenLandmarkImage = UIImage()
    
    var landMarkNames = ["stone henge", "taj mahal", "kremlin", "great wall", "colosseum"]
    
    var landMarkImages: [UIImage] = [UIImage(named: "stonehenge")!, UIImage(named: "tajmahal")!, UIImage(named: "kremlin")!, UIImage(named: "greatwall")!, UIImage(named: "colosseum")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Landmark book"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landMarkNames[indexPath.row]
        cell.imageView?.image = landMarkImages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            landMarkNames.remove(at: indexPath.row)
            landMarkImages.remove(at: indexPath.row)
            
            //tableView.reloadData()
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandMarkName = landMarkNames[indexPath.row]
        
        chosenLandmarkImage = landMarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailVC" {
            
            if let destVC = segue.destination as? DetailViewController {
                
                destVC.image = chosenLandmarkImage
                
                destVC.placetitle = chosenLandMarkName
                
                
            }
            
        }
        
    }


}

