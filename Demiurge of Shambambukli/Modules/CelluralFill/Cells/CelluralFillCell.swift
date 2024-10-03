import UIKit

final class CelluralFillCell: UITableViewCell {
    // MARK: - Private properties
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let emojiView = UIView()
    private let emojiLabel = UILabel()
    private var gradientLayer: CAGradientLayer?
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        addSubviews()
        makeConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) не был реализован")
    }
    
    // MARK: - Overrides
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        descriptionLabel.text = nil
        emojiLabel.text = nil
        
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: Constants.contentViewInsets)
        gradientLayer?.frame = emojiView.bounds
    }
}

// MARK: - Configure

extension CelluralFillCell {
    func configure(with state: CelluralFillCellState) {
        titleLabel.text = state.title
        descriptionLabel.text = state.description
        gradientLayer?.removeFromSuperlayer()
        
        gradientLayer = CAGradientLayer()
        gradientLayer?.colors = state.background.map { $0.cgColor }
        gradientLayer?.startPoint = Constants.gradientLayerStartPoint
        gradientLayer?.endPoint = Constants.gradientLayerEndPoint
        
        layoutIfNeeded()
        gradientLayer?.frame = emojiView.bounds
        
        if let gradientLayer = gradientLayer {
            emojiView.layer.insertSublayer(gradientLayer, at: .zero)
        }
        
        emojiLabel.text = state.rawValue
    }
}

// MARK: - Functions

private extension CelluralFillCell {
    func setup() {
        backgroundColor = .clear
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        
        setupLabels()
        emojiView.layer.masksToBounds = true
        emojiView.layer.cornerRadius = Constants.emojiViewCornerRadius
        emojiView.backgroundColor = .clear
        
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLabels() {
        titleLabel.font = Constants.titleLabelFont
        titleLabel.textColor = .black
        
        descriptionLabel.font = Constants.descriptionLabelFont
        descriptionLabel.textColor = .black
    }
    
    func addSubviews() {
        contentView.addSubviews(emojiView, titleLabel, descriptionLabel)
        emojiView.addSubview(emojiLabel)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            emojiView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: Constants.cellImageViewTopAnchor),
            emojiView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Constants.cellImageViewLeadingAnchor),
            emojiView.widthAnchor.constraint(equalToConstant: Constants.emojiViewSize.width),
            emojiView.heightAnchor.constraint(equalToConstant: Constants.emojiViewSize.height),
            
            emojiLabel.centerXAnchor.constraint(equalTo: emojiView.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: emojiView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: emojiView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: emojiView.trailingAnchor,
                                                constant: Constants.titleLabelTrailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                  constant: Constants.descriptionLabelTopAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }
}

// MARK: - Constants

private extension CelluralFillCell {
    enum Constants {
        static let cellImageViewTopAnchor: CGFloat = 16
        static let cellImageViewLeadingAnchor: CGFloat = 16
        
        static let titleLabelTrailingAnchor: CGFloat = 16
        static let descriptionLabelTopAnchor: CGFloat = 4
        
        static let contentViewInsets: UIEdgeInsets = .init(top: 0, left: 0, bottom: 10, right: 0)
        static let contentViewCornerRadius: CGFloat = 8
        
        static let gradientLayerStartPoint: CGPoint = .init(x: 0.0, y: 0.0)
        static let gradientLayerEndPoint: CGPoint = .init(x: 1.0, y: 1.0)
        
        static let emojiViewCornerRadius: CGFloat = 20
        static let emojiViewSize: CGSize = .init(width: 40, height: 40)
        
        static let titleLabelFont: UIFont = UIFont.systemFont(ofSize: 22, weight: .semibold)
        static let descriptionLabelFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
}
