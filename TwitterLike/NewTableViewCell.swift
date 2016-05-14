//
//  NewTableViewCell.swift
//  TwitterLike
//
//  Created by Aldrin Bautista on 14/05/2016.
//  Copyright © 2016 Aldrin Bautista. All rights reserved.
//

import Cocoa

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var fullnameLabel: UILabel!
    
    @IBOutlet weak var postLabel: UILabel!
 
    @IBOutlet weak var imageView: UIView!
    
    func downloadImage(url: NSURL){
        print("Download Started")
        print("lastPathComponent: " + (url.lastPathComponent ?? ""))
        getDataFromUrl(url) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                print(response?.suggestedFilename ?? "")
                print("Download Finished")
                imageView.image = UIImage(data: data)
            }
        }
    }
}
