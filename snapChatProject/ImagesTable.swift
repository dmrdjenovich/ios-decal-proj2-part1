//
//  ImagesTable.swift
//  snapChatProject
//
//  Created by David Mrdjenovich on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImagesTable : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imageTable: UITableView!
    
    var chosenImage : UIImage?;
    
    override func viewDidLoad () {
        super.viewDidLoad();
        imageTable.delegate = self;
        imageTable.dataSource = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false;
        tabBarController?.tabBar.isHidden = false;
        imageTable.reloadData();
    }
    
    func tableView (_ tableView : UITableView, titleForHeaderInSection section : Int) -> String? {
        return threadNames[section];
    }
    
    func numberOfSections (in tableView : UITableView) -> Int {
        return threadNames.count;
    }
    
    func tableView (_ tableView : UITableView, numberOfRowsInSection : Int) -> Int {
        return threads[threadNames[numberOfRowsInSection]]!.count;
    }
    
    func tableView (_ tableView : UITableView, didSelectRowAt indexPath : IndexPath) {
        let img : SnapImage = threads[threadNames[indexPath.section]]![indexPath.row]
        if (!img.read) {
            img.read = true;
            chosenImage = img.img;
            performSegue(withIdentifier:"viewImage", sender:nil);
        }
    }
    
    func tableView (_ tableView : UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell {
        let img : SnapImage = threads[threadNames[indexPath.section]]![indexPath.row]
        let cell : ImageTableSelectCell = (tableView.dequeueReusableCell(withIdentifier: "imageEntry")) as! ImageTableSelectCell;
        cell.senderLabel.text = userName;
        cell.timeLabel.text = img.getElapsedTimeString();
        if img.read {
            cell.readIndicator.image = #imageLiteral(resourceName: "read");
        }
        else {
            cell.readIndicator.image = #imageLiteral(resourceName: "unread");
        }
        return cell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! ImageViewer).img = chosenImage;
    }
}

class ImageTableSelectCell : UITableViewCell {
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var readIndicator: UIImageView!
}

class ImageViewer : UIViewController {
    var img : UIImage?;
    @IBOutlet weak var imgControl: UIButton!
    
    override func viewDidLoad () {
        super.viewDidLoad();
        navigationController?.isNavigationBarHidden = true;
        tabBarController?.tabBar.isHidden = true;
        imgControl.setBackgroundImage(img!, for: .normal)
        imgControl.setTitle("", for: .normal);
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: false);
    }
    
}

