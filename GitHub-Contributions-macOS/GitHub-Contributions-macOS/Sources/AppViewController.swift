import Foundation
import Cocoa
import WebKit

class AppViewController: NSViewController {
    // MARK: - Property Definition
    let appDefaults = AppHelper.appGroupDefaults
    @IBOutlet weak var svgWebView: WKWebView!
    @IBOutlet weak var setUsernameLabel: NSTextField!
    
    // MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load data from UserDefaults, if there is data
        if let username = AppHelper.appGroupDefaults.username {
            didSet(username: username)
        }
    }
    
    // MARK: - User Interface Actions
    @IBAction func setButtonPressed(_ sender: Any) {
        print(appDefaults.username!)
        fetchContributions(username: appDefaults.username!)
    }
    
    // MARK: - Methods
    private func fetchContributions(username: String) {
        let contributionTuple = GitHubHelper.fetch(for: username)
        self.svgWebView.loadHTMLString(contributionTuple.svgXMLString, baseURL: nil)
    }
}

extension AppViewController: ChangeUsernameViewControllerDelegate {
    // MARK: - Delegation
    func didSet(username: String) {
        self.setUsernameLabel.stringValue = username + " (" + String(GitHubHelper.fetch(for: username).thisYearsContributionCount) + ")"
    }
}
