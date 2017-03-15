//
//  imageFeed.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

// This is the only line of code you should be modifying
// These threads represent differnet feeds. 
var threads: [String: [SnapImage]] = ["Memes": [], "Dog Spots": [], "Random": []]
//
var userName : String = "DMRDJ";

let threadNames = ["Memes", "Dog Spots", "Random"]
var allImages: [UIImage] = [#imageLiteral(resourceName: "cutePuppy"), #imageLiteral(resourceName: "berkAtNight"), #imageLiteral(resourceName: "dankMeme4"), #imageLiteral(resourceName: "Campanile"), #imageLiteral(resourceName: "dankMeme1"), #imageLiteral(resourceName: "dankMeme2"), #imageLiteral(resourceName: "amazingCutePuppy"), #imageLiteral(resourceName: "cutePuppy"), #imageLiteral(resourceName: "dirks"), #imageLiteral(resourceName: "dankMeme3")]

class SnapImage {
    var img : UIImage;
    var read : Bool;
    var time : Date;
    
    init (_ img : UIImage) {
        self.img = img;
        read = false;
        time = Date();
    }
    
    func getElapsedTimeString () -> String {
        let interval : TimeInterval = -time.timeIntervalSinceNow;
        var remainder : Double = interval;
        let days : Int = Int(remainder) / (24 * 60 * 60);
        remainder -= Double(days * 24 * 60 * 60);
        let hours : Int = Int(remainder) / (60 * 60);
        remainder -= Double(hours * 60 * 60);
        let mins : Int = Int(remainder) / 60;
        if days != 0 {
            if days == 1 {
                return "1 Day Ago";
            }
            else {
                return "\(days) Days Ago";
            }
        }
        if hours != 0 {
            if hours == 1 {
                return "1 Hour Ago";
            }
            else {
                return "\(hours) Hours Ago";
            }
        }
        if mins == 1 {
            return "1 Minute Ago";
        }
        return "\(mins) Minutes Ago";
    }
}
