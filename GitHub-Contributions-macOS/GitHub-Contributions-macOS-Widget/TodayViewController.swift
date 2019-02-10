//
//  TodayViewController.swift
//  GitHub-Contributions-macOS-Widget
//
//  Created by Felix Förtsch on 10.02.19.
//  Copyright © 2019 Felix Förtsch. All rights reserved.
//

import Cocoa
import NotificationCenter

class TodayViewController: NSViewController, NCWidgetProviding {
    @IBOutlet weak var usernameLabel: NSTextField!
    
    override var nibName: NSNib.Name? {
        return NSNib.Name("TodayViewController")
    }

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Update your data and prepare for a snapshot. Call completion handler when you are done
        // with NoData if nothing has changed or NewData if there is new data since the last
        // time we called you
        completionHandler(.noData)
        self.usernameLabel.stringValue = AppHelper.appGroupDefaults.username!
    }

}
