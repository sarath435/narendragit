//
//  ViewController.swift
//  imageViewJsoon
//
//  Created by brn.developers on 5/10/18.
//  Copyright © 2018 brn.developers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var arr = String()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var spouseLbl: UILabel!
    
    var urlSessionObj = URLSession(configuration: URLSessionConfiguration.default)
    
    var urlRequestObj:URLRequest?
    var urlDataTask:URLSessionDataTask?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLbl.textColor = UIColor.red
       urlRequestObj?.httpMethod = "GET"
        urlRequestObj = URLRequest(url: URL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")!)
        urlDataTask = urlSessionObj.dataTask(with: urlRequestObj!, completionHandler: { (data, res, err) in
            
            do{
                let serRes = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)as! NSDictionary
          let actorsw = serRes["actors"] as! NSArray
             let a = actorsw[0]
                let n = a as! NSDictionary
                
                let c = n.value(forKey: "name") as! String
                self.arr.append(c)
                print(self.arr)
                
            }
            catch
            {
               print("error")
            }
            
            DispatchQueue.main.async {
                self.nameLbl.text = self.arr
            }
            
        })
        urlDataTask?.resume()
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

