//
//  ViewController.swift
//  TwitterLike
//
//  Created by Aldrin Bautista on 14/05/2016.
//  Copyright © 2016 Aldrin Bautista. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data: Array<NSDictionary> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, "https://api.prime58.com/v1/posts/?access_token=test")
            .responseJSON {
                (response) in
                self.data = response.result.value as? Array<NSDictionary>
                
                self.tableView.reloadData()
        };
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewTVCell") as! NewTableViewCell
        
        cell.usernameLabel.text = self.data[indexPath.row].objetForKey["username"]
        cell.fullnameLabel.text = self.data[indexPath.row].objetForKey["full_name"]
        cell.postLabel.text = self.data[indexPath.row].objetForKey["post"]
        cell.downloadImage(NSURL(self.data[indexPath.row].objetForKey["post_image"]))
        
        return cell;
    }
}