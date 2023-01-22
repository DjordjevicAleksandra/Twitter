import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let lineViewBottom: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        
        return view
    }()
    
    private let lineViewTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        
        return view
    }()
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        backgroundColor = .white
        
        addSubview(label)
        addSubview(lineViewBottom)
        addSubview(lineViewTop)
        
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        
        lineViewBottom.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        lineViewBottom.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lineViewBottom.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lineViewBottom.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        lineViewTop.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        lineViewTop.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        lineViewTop.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lineViewTop.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
