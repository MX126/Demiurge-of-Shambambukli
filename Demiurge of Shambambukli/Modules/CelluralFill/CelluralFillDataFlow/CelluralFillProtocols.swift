import Foundation

protocol CelluralFillModuleInput {
    var moduleOutput: CelluralFillModuleOutput? { get }
}

protocol CelluralFillModuleOutput: AnyObject {
}

protocol CelluralFillViewInput: AnyObject {
    func configure(with model: CelluralFillViewModel)
}

protocol CelluralFillViewOutput: AnyObject {
    func didLoadView()
}
