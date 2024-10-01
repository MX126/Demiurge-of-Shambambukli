import UIKit

final class BlurGradientView: UIView {
    // MARK: - Initialize
    
    init(frame: CGRect, gradientColors: [UIColor], blurStyle: UIBlurEffect.Style = .light) {
        super.init(frame: frame)
        
        setupBlurEffect(blurStyle: blurStyle)
        setupGradientLayer(colors: gradientColors)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) не был реализован")
    }
    
    // MARK: - Overrides
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for subview in subviews {
            subview.frame = bounds
        }
    }
}

// MARK: - Setup

private extension BlurGradientView {
    func setupBlurEffect(blurStyle: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: blurStyle)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
    
    func setupGradientLayer(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = Constants.gradientStartPoint
        gradientLayer.endPoint = Constants.gradientEndPoint
        
        let gradientView = UIView(frame: bounds)
        gradientView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        gradientView.layer.addSublayer(gradientLayer)
        
        addSubview(gradientView)
    }
}

// MARK: - Constants

private extension BlurGradientView {
    enum Constants {
        static let gradientStartPoint: CGPoint = .init(x: 0.5, y: 0.0)
        static let gradientEndPoint: CGPoint = .init(x: 0.5, y: 1.0)
    }
}
