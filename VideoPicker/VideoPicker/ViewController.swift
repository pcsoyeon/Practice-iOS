//
//  ViewController.swift
//  VideoPicker
//
//  Created by soyeon on 2021/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var videoPicker: VideoPicker!
    @IBOutlet weak var videoView: VideoView!
    @IBOutlet weak var videoPickerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.videoView.contentMode = .scaleAspectFill
        self.videoView.player?.isMuted = true
        self.videoView.repeat = .loop
    }
    
    @IBAction func videoPickerButtonTouched(_ sender: UIButton) {
        self.videoPicker = VideoPicker(presentationController: self, delegate: self)
        self.videoPicker.present(from: sender)
    }
    
}

extension ViewController: VideoPickerDelegate {
    
    func didSelect(url: URL?) {
        guard let url = url else {
            return
        }
        self.videoView.url = url
        self.videoView.player?.play()
    }
}


