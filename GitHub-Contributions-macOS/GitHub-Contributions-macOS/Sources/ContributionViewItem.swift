import Cocoa
import SnapKit

class ContributionViewItem: NSCollectionViewItem {
    let label = NSTextField(labelWithString: "2")
    
    override func viewDidLoad() {
        view.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.center.equalToSuperview()
        }
    }
    override func loadView() {
        self.view = NSView()
    }
    
    public func set(_ contribution: Contribution) {
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = contribution.color.cgColor
        self.label.stringValue = "\(contribution.dataCount)"
    }
}
