import Foundation
import Cocoa
import WebKit

class AppViewController: NSViewController {
    // MARK: - Property Definition
    let appDefaults = AppHelper.appGroupDefaults
    @IBOutlet weak var usernameTextField: NSTextField!
    @IBOutlet weak var overviewLabel: NSTextField!
    @IBOutlet weak var svgWebView: WKWebView!
    
    // MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load data from UserDefaults, if there is data
        self.usernameTextField.stringValue = loadDataFromAppDefaults()
        self.overviewLabel.stringValue = GitHubHelper.fetch(for: "felixfoertsch").thisYearsContribution
    }
    
    private func loadDataFromAppDefaults() -> String {
        if let username = AppHelper.appGroupDefaults.username {
            return username
        }
        return ""
    }
    
    // MARK: - User Interface Actions
    @IBAction func enterUsername(_ sender: Any) {
       appDefaults.username = usernameTextField.stringValue
    }
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
}
