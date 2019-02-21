import Cocoa

class ContributionViewItem: NSCollectionViewItem {

    // 1
    var image: NSImage? {
        didSet {
            guard isViewLoaded else { return }
            if let imageFile = image {
                imageView?.image = imageFile
            } else {
                imageView?.image = nil
            }
        }
    }
    
    // 2
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.lightGray.cgColor
    }
    
}
