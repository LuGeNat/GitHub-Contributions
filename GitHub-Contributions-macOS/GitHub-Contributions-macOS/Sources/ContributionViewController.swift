import Cocoa
import SnapKit

class ContributionViewController: NSViewController {
    @IBOutlet weak var collectionView: NSCollectionView!
    
    var contributions = [Contribution]()
    
    override func viewDidLoad() {
        if let username = AppHelper.appGroupDefaults.username {
            let tuple = GitHubHelper.fetch(for: username)
            self.contributions = tuple.contributions
        }
        self.collectionView.register(ContributionViewItemCode.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("ContributionViewItemCode"))
    }
}

extension ContributionViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return AppHelper.contributions.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let contribution = AppHelper.contributions[indexPath.item]
        
        let item = self.collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("ContributionViewItemCode"), for: indexPath)
        item.view = NSImageView(image: contribution.image)
        let label = NSTextField(labelWithString: "\(contribution.dataCount)")
        item.view.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.center.equalToSuperview()
        }
        return item
    }
}
