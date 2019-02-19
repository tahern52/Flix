//
//  MovieGridDetailsViewController.swift
//  Flix
//
//  Created by Taher on 2/19/19.
//  Copyright © 2019 codepath. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridDetailsViewController: UIViewController {

    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseURL = "https://image.tmdb.org/t/p/"
        
        let backdrop = "w1280\(movie["backdrop_path"] as! String)"
        let backdropURL = URL(string: baseURL + backdrop)
        
        let poster = "w185\(movie["poster_path"] as! String)"
        let posterURL = URL(string: baseURL + poster)
        
        backdropImage.af_setImage(withURL: backdropURL!)
        posterImage.af_setImage(withURL: posterURL!)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let trailerView = segue.destination as! TrailerViewController
        
        // Pass the selected object to the new view controller.
        trailerView.movie = self.movie
    }

}
