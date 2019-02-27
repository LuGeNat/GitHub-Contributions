import Cocoa

class AppWindowController: NSWindowController {
    
    @IBOutlet weak var usernameButton: NSToolbarItem!
    @IBOutlet weak var usernameButtonCell: NSButtonCell!
    
    @IBAction func usernameButtonPressed(_ sender: Any) {
        let sb = NSStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateController(withIdentifier: "ChangeUsernameViewController") as! ChangeUsernameViewController
        vc.delegate = self
        self.window?.contentViewController?.presentAsSheet(vc)
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        if let username = AppHelper.appGroupDefaults.username {
            GitHubHelper.fetch(for: username)
        }
    }
    
    override func windowDidLoad() {
        if let username = AppHelper.appGroupDefaults.username {
            didSet(username: username)
        }
    }
    
}

extension AppWindowController: ChangeUsernameViewControllerDelegate {
    func didSet(username: String) {
        let updatedString = username + " (" + String(GitHubHelper.fetch(for: username).thisYearsContributionCount) + ")"
        self.usernameButton.label = updatedString
        self.usernameButtonCell.title = updatedString
    }
}
