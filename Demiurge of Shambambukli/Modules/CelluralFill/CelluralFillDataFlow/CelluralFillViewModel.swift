import UIKit

struct CelluralFillViewModel {
    let labelTitle: NSAttributedString
    let actionButtonTitle: String
    
    init() {
        self.labelTitle = NSAttributedString(string: "Клеточное наполнение", attributes: Styles.titleAttributes)
        self.actionButtonTitle = "СОТВОРИТЬ"
    }
}

private extension CelluralFillViewModel {
    struct Styles {
        static let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
    }
}
