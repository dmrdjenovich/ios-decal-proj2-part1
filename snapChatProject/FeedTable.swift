//
//  FeedTable.swift
//  snapChatProject
//
//  Created by David Mrdjenovich on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedTable : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var postButton: UIButton!
    
    var imageSelection : UIImage?;
    var feedSelection : String?;
    var statusIndicator : UINavigationItem?;

    override func viewDidLoad () {
        super.viewDidLoad();
        feedTableView.delegate = self;
        feedTableView.dataSource = self;
    }
    
    func tableView (_ tableView : UITableView, numberOfRowsInSection : Int) -> Int {
        return threadNames.count;
    }
    
    func tableView (_ tableView : UITableView, didSelectRowAt indexPath : IndexPath) {
        feedSelection = threadNames[indexPath.row];
        postButton.setTitle("Make Post to: " + feedSelection!, for:.normal);
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FeedTableCell = tableView.dequeueReusableCell(withIdentifier: "feedTableCellID", for: indexPath) as! FeedTableCell;
        cell.cellLabel.text = threadNames[indexPath.row];
        return cell;
    }
    
    @IBAction func feedButtonClick(_ sender: UIButton) {
        if feedSelection == nil {return;}
        threads[feedSelection!]!.append(SnapImage(imageSelection!));
        self.navigationController?.popViewController(animated: true)
        statusIndicator!.title = "Success!";
    }
}

class FeedTableCell : UITableViewCell {
    @IBOutlet weak var cellLabel: UILabel!
}


