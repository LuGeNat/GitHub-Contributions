import Foundation
import Cocoa
import WebKit

class AppViewController: NSViewController, ChangeUsernameViewControllerDelegate {
    // MARK: - Property Definition
    let appDefaults = AppHelper.appGroupDefaults
    @IBOutlet weak var overviewLabel: NSTextField!
    @IBOutlet weak var svgWebView: WKWebView!
    @IBOutlet weak var setUsernameLabel: NSTextField!
    
    // MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load data from UserDefaults, if there is data
        if let username = AppHelper.appGroupDefaults.username {
            self.setUsernameLabel.stringValue = username
        }
        self.overviewLabel.stringValue = GitHubHelper.fetch(for: "felixfoertsch").thisYearsContribution
    }
    
    // MARK: - User Interface Actions
    @IBAction func setButtonPressed(_ sender: Any) {
        print(appDefaults.username!)
        fetchContributions(username: appDefaults.username!)
    }
    
    // MARK: - Methods
    private func fetchContributions(username: String) {
        let contributionTuple = GitHubHelper.fetch(for: username)
        self.overviewLabel.stringValue = contributionTuple.thisYearsContribution
        self.svgWebView.loadHTMLString(contributionTuple.svgXMLString, baseURL: nil)
    }
    
    // MARK: - Delegation
    func didSet(username: String) {
        setUsernameLabel.stringValue = username
    }
}
