import UIKit

extension UIView {
    /// Добавляет несколько subviews в иерархию представлений
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
