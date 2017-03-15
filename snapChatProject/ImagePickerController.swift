//
//  imagePickerController.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImagePickerController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var chosenImage : UIImage?;
    
    @IBOutlet var imageCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageCollectionView.collectionViewLayout = ImageFlowLayout.init()
        self.imageCollectionView.backgroundColor = UIColor.lightGray
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.title = "Snapchat 2.0";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func selectImage(_ image: UIImage) {
        //The image being selected is passed in as "image".
        chosenImage = image;
        performSegue(withIdentifier:"postImage", sender:nil);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as! FeedTable).imageSelection = chosenImage;
        (segue.destination as! FeedTable).statusIndicator = navigationItem;
    }
    
    
    //DON'T MODIFY CODE HERE AND BELOW!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickImageCell", for: indexPath) as! imageCollectionVieCell
        cell.image.image = allImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! imageCollectionVieCell
        selectImage(selectedCell.image.image!)
    }
}
