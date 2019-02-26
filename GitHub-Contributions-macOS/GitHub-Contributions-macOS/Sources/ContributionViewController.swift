import Cocoa
import SnapKit

class ContributionViewController: NSViewController {
    @IBOutlet weak var collectionView: NSCollectionView!
    
    #warning("TODO: Think about force unwrap")
    let contributions = GitHubHelper.fetch(for: AppHelper.appGroupDefaults.username!).contributions

    private func fetchContributions(username: String) -> [Contribution] {
        return GitHubHelper.fetch(for: username).contributions
    }
    
    override func viewDidLoad() {
//        self.collectionView.register(NSNib(nibNamed: "ContributionViewItemXIB", bundle: nil), forItemWithIdentifier: NSUserInterfaceItemIdentifier("ContributionViewItemXIB"))
        self.collectionView.register(ContributionViewItemCode.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier("ContributionViewItemCode"))
    }
}

extension ContributionViewController: NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return contributions.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let contribution = contributions[indexPath.item]
        
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
