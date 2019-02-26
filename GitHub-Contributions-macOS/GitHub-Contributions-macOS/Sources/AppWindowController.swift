import Cocoa

class AppWindowController: NSWindowController {
    
    @IBOutlet weak var usernameButtonCell: NSButtonCell!
    @IBOutlet weak var usernameButton: NSToolbarItem!
    
    @IBAction func usernameButtonPressed(_ sender: Any) {
        let sb = NSStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateController(withIdentifier: "ChangeUsernameViewController") as! ChangeUsernameViewController
        vc.delegate = self
        self.window?.contentViewController?.presentAsSheet(vc)
    }
    
    override func windowDidLoad() {
        if let username = AppHelper.appGroupDefaults.username {
            didSet(username: username)
        }
    }
    
}

extension AppWindowController: ChangeUsernameViewControllerDelegate {
    // MARK: - Delegation
    func didSet(username: String) {
        let updatedString = username + " (" + String(GitHubHelper.fetch(for: username).thisYearsContributionCount) + ")"
        self.usernameButton.label = updatedString
        self.usernameButtonCell.title = updatedString
    }
}
