import UIKit

class TwitterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellNameLabel: UILabel!
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = Constants.Colors.twitterBlueColor?.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(Constants.Colors.twitterBlueColor, for: .normal)
        
        let image = UIImage(named: "follow")?.withTintColor(Constants.Colors.twitterBlueColor!)
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
    
    var users: User? {
        didSet {
            guard let users = users else { return }
            
            nameLabel.text = users.name
            usernameLabel.text = users.username
            bioTextView.text = users.bio
            
            let url = URL(string: users.profileImageURL)
            let data = try? Data(contentsOf: url!)
            
            profileImage.image = UIImage(data: data!)
        }
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        backgroundColor = .white
        
        addSubview(profileImage)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        addSubview(lineView)
        
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        profileImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -8).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        usernameLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -8).isActive = true
        usernameLabel.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 8).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        bioTextView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor).isActive = true
        bioTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -4).isActive = true
        bioTextView.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 4).isActive = true
        bioTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 12).isActive = true
        
        followButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        followButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}

