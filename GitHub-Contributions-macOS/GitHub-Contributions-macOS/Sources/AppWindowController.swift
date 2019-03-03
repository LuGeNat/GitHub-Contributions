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
            self.update(username: username)
        }
    }
    
    override func windowDidLoad() {
        if let username = AppHelper.appGroupDefaults.username {
            setUsernameButton()
            update(username: username)
        } else {
            presentWelcomeWindow()
        }
    }
    
    private func presentWelcomeWindow() {
        // TODO: Create welcome screen
    }
    
    private func setUsernameButton() {
        if let username = AppHelper.appGroupDefaults.username {
            let updatedString = username + " (\(AppHelper.appGroupDefaults.thisYearsContributionCount ?? 0))"
            self.usernameButton.label = updatedString
            self.usernameButtonCell.title = updatedString
        } else {
            self.usernameButton.label = "Set your GitHub username!"
            self.usernameButtonCell.title = "Set your GitHub username!"
        }
        
    }
    
    private func update(username: String) {
        DispatchQueue.global(qos: .utility).async { [unowned self] in
            let tuple = GitHubHelper.fetch(for: username)
            AppHelper.appGroupDefaults.username = username
            AppHelper.appGroupDefaults.thisYearsContributionCount = tuple.thisYearsContributionCount
            AppHelper.contributions = tuple.contributions

            DispatchQueue.main.async {
                (self.contentViewController as! ContributionViewController).collectionView.reloadData()
                self.setUsernameButton()
            }
        }
    }
}

extension AppWindowController: ChangeUsernameViewControllerDelegate {
    func didSet(username: String) {
        update(username: username)
    }
}
