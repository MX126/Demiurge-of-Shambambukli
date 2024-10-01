import UIKit

final class CelluralFillCell: UITableViewCell {
    // MARK: - Private properties
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let emojiView = UIView()
    
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
        titleLabel.text = nil
        descriptionLabel.text = nil
        emojiView.backgroundColor = nil // подумать над обнуленем эмодзи
    }
}

// MARK: - Configure

extension CelluralFillCell {
    func configure(with text: String) {
        titleLabel.text = text
    }
}

// MARK: - Functions

private extension CelluralFillCell {
    func setup() {
        emojiView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews() {
        contentView.addSubviews(emojiView, titleLabel, descriptionLabel)
    }
        
    func makeConstraints() {
        NSLayoutConstraint.activate([
            emojiView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                               constant: Constants.cellImageViewTopAnchor),
            emojiView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                   constant: Constants.cellImageViewLeadingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: emojiView.topAnchor,
                                            constant: Constants.titleLabelTopAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: emojiView.trailingAnchor,
                                                constant: Constants.titleLabelTrailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                  constant: Constants.descriptionLabelTopAnchor)
        ])
    }
}

// MARK: - Constants

private extension CelluralFillCell {
    enum Constants {
        static let cellImageViewTopAnchor: CGFloat = 16
        static let cellImageViewLeadingAnchor: CGFloat = 16
        
        static let titleLabelTopAnchor: CGFloat = 16
        static let titleLabelTrailingAnchor: CGFloat = 16
        
        static let descriptionLabelTopAnchor: CGFloat = 4
    }
}
