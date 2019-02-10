import Cocoa

class ChangeUsernameViewController: NSViewController {
    let appDefaults = AppHelper.appGroupDefaults
    weak var delegate: AppViewController?
    @IBOutlet weak var usernameTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        if let username = AppHelper.appGroupDefaults.username {
            self.usernameTextField.stringValue = username
        }
    }
    
    @IBAction func setButtonPressed(_ sender: Any) {
        AppHelper.appGroupDefaults.username = usernameTextField.stringValue
        delegate?.didSet(username: usernameTextField.stringValue)
        self.dismiss(sender)
    }
}

protocol ChangeUsernameViewControllerDelegate {
    func didSet(username: String)
}
