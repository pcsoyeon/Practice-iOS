//
//  ViewController.swift
//  Share
//
//  Created by soyeon on 2021/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpShareButton(_ sender: Any) {
        let imageToShare = self.view.toImage()
        let activityItems : NSMutableArray = []
        activityItems.add(imageToShare)
        
        let activityVC = UIActivityViewController(activityItems: activityItems as [AnyObject], applicationActivities: nil)
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
}

extension UIView {
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

