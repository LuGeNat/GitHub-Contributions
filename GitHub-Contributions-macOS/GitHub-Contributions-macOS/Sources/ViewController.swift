import Foundation
import Cocoa
import WebKit

class ViewController: NSViewController {
    @IBOutlet weak var usernameTextField: NSTextField!
    @IBOutlet weak var lastYearsContributionLabel: NSTextField!

    @IBAction func didEnterUsername(_ sender: AnyObject) {
        if self.usernameTextField.stringValue.count > 0 {
            let username = self.usernameTextField.stringValue
            AppHelper.sharedInstance.username = username
            fetchContributions(username: username)
        }
    }
    
    private func fetchContributions(username: String) {
        let helper = GitHubHelper.fetch(for: username)
        self.lastYearsContributionLabel.stringValue = helper.thisYearsContribution
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = AppHelper.sharedInstance.username else {
            return
        }
        self.fetchContributions(username: username)
    }
}
