import Cocoa

class ChangeUsernameViewController: NSViewController {
    let appDefaults = AppHelper.appGroupDefaults
    weak var delegate: AppWindowController?
    @IBOutlet weak var usernameTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let username = AppHelper.appGroupDefaults.username {
            self.usernameTextField.stringValue = username
        } else {
            self.usernameTextField.placeholderString = "Enter your GitHub username"
        }
        usernameTextField.delegate = self
    }
    
    @IBAction func setButtonPressed(_ sender: Any) {
        AppHelper.appGroupDefaults.username = usernameTextField.stringValue
        delegate?.didSet(username: usernameTextField.stringValue)
        self.dismiss(sender)
    }
}

extension ChangeUsernameViewController: NSTextFieldDelegate {
    func controlTextDidEndEditing(_ obj: Notification) {
        setButtonPressed(Any.self)
    }
}

protocol ChangeUsernameViewControllerDelegate {
    func didSet(username: String)
}
