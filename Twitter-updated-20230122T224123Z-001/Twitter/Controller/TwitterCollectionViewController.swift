import UIKit

class TwitterCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    var homeResponse: HomeResponse! {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
        APIService.shared.fetchHomeData { [weak self] response in
            self?.homeResponse = response
        }
    }

    // MARK: - UI Configuration

    private func setupUI() {
        collectionView.backgroundColor = Constants.Colors.backgroundBlueColor
        setupNavigationBarItems()
    }

    private func setupCollectionView() {
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
        collectionView.register(TwitterCollectionViewTweet.self, forCellWithReuseIdentifier: TwitterCollectionViewTweet.identifier)
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
}

// UICollectionViewDelegate
extension TwitterCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

// UICollectionViewDataSource {
extension TwitterCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 1 ? homeResponse.tweets.count : homeResponse.users.count
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 1 {
            let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: TwitterCollectionViewTweet.identifier, for: indexPath) as? TwitterCollectionViewTweet)!

            cell.tweets = homeResponse.tweets[indexPath.item]

            return cell
        }

        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? TwitterCollectionViewCell)!

        cell.users = homeResponse.users[indexPath.item]

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView

            return header
        }


        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath) as! FooterCollectionReusableView

        return footer
    }
}

extension TwitterCollectionViewController: UICollectionViewDelegateFlowLayout {
    @objc func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.section == 0 {
            let user = homeResponse.users[indexPath.item]
            let estimatedHeight = estimatedHeightForCell(user.bio)
            return estimatedHeight
        } else if indexPath.section == 1 {
            let tweet = homeResponse.tweets[indexPath.item]
            let estimatedHeight = estimatedHeightForCell(tweet.message)
            return estimatedHeight
        }

        /// should not be called
        return CGSize(width: view.frame.width, height: 200)
    }

    @objc func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        if section == 1 {
            return .zero
        }

        return CGSize(width: collectionView.frame.size.width, height: 50)
    }

    @objc func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {

        if section == 1 {
            return .zero
        }

        return CGSize(width: collectionView.frame.size.width, height: 64)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    private func estimatedHeightForCell(_ text: String) -> CGSize {
        let aproximateWidth = view.frame.width - 12 - 50 - 12
        let size = CGSize(width: aproximateWidth, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]

        let estematedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

        return CGSize(width: view.frame.width, height: estematedFrame.height + 66)
    }
}

extension TwitterCollectionViewController {

    func setupNavigationBarItems() {

        setupLeftNavItem()
        setupRightNavItems()
        setupRemainingNavItems()
    }

    private func setupLeftNavItem() {

        let followButton = UIButton(type: .custom)
        let followImage = UIImage(named: "follow")?.withTintColor(Constants.Colors.twitterBlueColor!)
        followButton.setImage(followImage, for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }

    private func setupRightNavItems() {

        let searchButton = UIButton(type: .custom)
        let searchImage = UIImage(named: "search")?.withTintColor(Constants.Colors.twitterBlueColor!)
        searchButton.setImage(searchImage, for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)

        let composeButton = UIButton(type: .custom)
        let composeImage = UIImage(named: "compose")?.withTintColor(Constants.Colors.twitterBlueColor!)
        composeButton.setImage(composeImage, for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)

        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: searchButton), UIBarButtonItem(customView: composeButton)]
    }

    private func setupRemainingNavItems() {

        let titleImage = UIImage(named: "title_icon")
        let titleImageView = UIImageView(image: titleImage)
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit

        navigationItem.titleView = titleImageView

        navigationController?.navigationBar.backgroundColor = .white
    }
}
