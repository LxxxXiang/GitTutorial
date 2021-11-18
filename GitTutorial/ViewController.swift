//
//  ViewController.swift
//  GitTutorial
//
//  Created by 廖翔 on 2021/11/13.
//

import UIKit


class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        // 生成建立通知的按鈕
        let createNotificationBtn: UIButton = UIButton()
        createNotificationBtn.frame = CGRect(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 25, width: 200, height: 50)
        createNotificationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        createNotificationBtn.setTitle("建立通知", for: .normal)
        createNotificationBtn.setTitleColor(UIColor.white, for: .normal)
        createNotificationBtn.layer.cornerRadius = 10
        createNotificationBtn.backgroundColor = UIColor.darkGray
        createNotificationBtn.addTarget(self, action: #selector(ViewController.onClickCreateNotificationBtn(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(createNotificationBtn)
    }
    
    // 點擊建立通知按鈕
    @objc func onClickCreateNotificationBtn(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.title = "title：測試本地通知"
        content.subtitle = "subtitle：法蘭克"
        content.body = "body：法蘭克的IOS世界"
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        // 設置通知的圖片
        let imageURL: URL = Bundle.main.url(forResource: "loveG", withExtension: "png")!
        let attachment = try! UNNotificationAttachment(identifier: "image", url: imageURL, options: nil)
        content.attachments = [attachment]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            print("成功建立通知...")
        })
    }
}

