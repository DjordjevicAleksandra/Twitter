import UIKit

class TwitterCollectionViewTweet: UICollectionViewCell {
    
    static let identifier = "Tweet"
    @IBOutlet weak var cellNameLabel: UILabel!
    
    let profileImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "reply")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "retweet")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "like")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "send_message")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        
        return view
    }()
    
    var tweets: Tweet? {
        didSet {
            guard let tweets = tweets else { return }
            
            let atributedText = NSMutableAttributedString(string: tweets.user.name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
            let usernameString = "  \(tweets.user.username)\n"
            atributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.systemGray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            
            let range = NSMakeRange(0, atributedText.string.count)
            atributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            atributedText.append(NSAttributedString(string: tweets.message, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
            
            messageTextView.attributedText = atributedText
            
            let url = URL(string: tweets.user.profileImageURL)
            let data = try? Data(contentsOf: url!)
            
            profileImage.image = UIImage(data: data!)
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        backgroundColor = .white
        
        self.addSubview(profileImage)
        self.addSubview(messageTextView)
        self.addSubview(lineView)
        
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        profileImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        messageTextView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        messageTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        messageTextView.leftAnchor.constraint(equalTo: profileImage.rightAnchor).isActive = true
        messageTextView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        setupBottomButtons()
    }
    
    fileprivate func setupBottomButtons() {
        
        let replyButtonContainerView = UIView()
        let retweetButtonContainerView = UIView()
        let likeButtonContainerView = UIView()
        let directMessageButtonContainerView = UIView()
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageButtonContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(buttonStackView)
        
        buttonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        buttonStackView.leftAnchor.constraint(equalTo: messageTextView.leftAnchor).isActive = true
        buttonStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        buttonStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        replyButton.topAnchor.constraint(equalTo: replyButtonContainerView.topAnchor).isActive = true
        replyButton.leftAnchor.constraint(equalTo: replyButtonContainerView.leftAnchor).isActive = true
        replyButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        replyButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        retweetButton.topAnchor.constraint(equalTo: retweetButtonContainerView.topAnchor).isActive = true
        retweetButton.leftAnchor.constraint(equalTo: retweetButtonContainerView.leftAnchor).isActive = true
        retweetButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        retweetButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        likeButton.topAnchor.constraint(equalTo: likeButtonContainerView.topAnchor).isActive = true
        likeButton.leftAnchor.constraint(equalTo: likeButtonContainerView.leftAnchor).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        directMessageButton.topAnchor.constraint(equalTo: directMessageButtonContainerView.topAnchor).isActive = true
        directMessageButton.leftAnchor.constraint(equalTo: directMessageButtonContainerView.leftAnchor).isActive = true
        directMessageButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        directMessageButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
