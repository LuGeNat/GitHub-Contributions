import Foundation
import Cocoa
import WebKit

class AppViewController: NSViewController {
    // MARK: - Property Definition
    let appDefaults = AppHelper.appGroupDefaults
    @IBOutlet weak var setUsernameLabel: NSTextField!
    
    // MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load data from UserDefaults, if there is data
        if let username = AppHelper.appGroupDefaults.username {
            didSet(username: username)
        }
    }
}

extension AppViewController: ChangeUsernameViewControllerDelegate {
    // MARK: - Delegation
    func didSet(username: String) {
        self.setUsernameLabel.stringValue = username + " (" + String(GitHubHelper.fetch(for: username).thisYearsContributionCount) + ")"
    }
}
