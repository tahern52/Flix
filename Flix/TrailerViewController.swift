//
//  TrailerViewController.swift
//  Flix
//
//  Created by Taher on 2/19/19.
//  Copyright © 2019 codepath. All rights reserved.
//

import UIKit

class TrailerViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var movie: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
    }
    

    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
