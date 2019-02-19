//
//  TrailerViewController.swift
//  Flix
//
//  Created by Taher on 2/19/19.
//  Copyright © 2019 codepath. All rights reserved.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var movie: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Query the API and get the results
        let id = movie["id"] as! Int
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                // Get the array of movies
                let results = dataDictionary["results"] as! [[String: Any]]
                let key = results[0]["key"] as? String
                
                // TODO: Store the movies in a property to use elsewhere

                let url = URL(string: "https://www.youtube.com/embed/\(key ?? "tAsegDwGJGA")?rel=0;&autoplay=1")
                
                print(url)
                self.webView.load(URLRequest(url: url!))
            }
        }
        task.resume()
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
