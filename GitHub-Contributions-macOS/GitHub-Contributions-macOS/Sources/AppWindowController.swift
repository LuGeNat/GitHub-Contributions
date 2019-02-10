import Cocoa

class AppWindowController: NSWindowController {
    @IBAction func preferencesButtonPressed(_ sender: Any) {
        let sb = NSStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateController(withIdentifier: "ChangeUsernameViewController") as! ChangeUsernameViewController
        vc.delegate = (self.window?.contentViewController as! AppViewController)
        self.window?.contentViewController?.presentAsSheet(vc)
    }
}
