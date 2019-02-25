import Cocoa

class ContributionViewItem: NSCollectionViewItem {

    override func viewDidLoad() {
        self.view = NSView()
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = ContributionView()
    }
    
}
