import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "FooterCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        addSubview(lineView)
        addSubview(whiteView)
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lineView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        whiteView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
        whiteView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        whiteView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
