//
//  NotificationManager.swift
//  Uber
//
//  Created by Ilya Schevchenko on 12.09.2024.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    init() {
        checkPermision()
    }
    
    func checkPermision() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            
            if success {
                print("DEBUG: Success Notification")
            } else if let error = error {
                print("DEBUG: Notification error is: \(error.localizedDescription)")
            }
        }
    }
    
    func sentNotification(with title: String, body: String, date: Date) {
        var trigger: UNNotificationTrigger?
        trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        print("DEBUG: Notification Send!")
    }
}
