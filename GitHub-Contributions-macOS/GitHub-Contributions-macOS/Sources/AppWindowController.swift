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
            update(username: username)
        }
    }
    
    override func windowDidLoad() {
        if let username = AppHelper.appGroupDefaults.username {
            update(username: username)
        } else {
            presentWelcomeWindow()
        }
    }
    
    private func presentWelcomeWindow() {
        // TODO: Create welcome screen
    }
    
    private func update(username: String) {
        AppHelper.appGroupDefaults.username = username
        
        AppHelper.contributions = GitHubHelper.fetch(for: username).contributions
        let vc = self.contentViewController as! ContributionViewController
        vc.collectionView.reloadData()
        
        let updatedString = username + " (" + String(GitHubHelper.fetch(for: username).thisYearsContributionCount) + ")"
        self.usernameButton.label = updatedString
        self.usernameButtonCell.title = updatedString
    }
}

extension AppWindowController: ChangeUsernameViewControllerDelegate {
    func didSet(username: String) {
//        AppHelper.appGroupDefaults.username = username
        update(username: username)
    }
}
