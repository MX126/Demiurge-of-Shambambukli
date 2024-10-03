import Foundation

protocol CelluralFillModuleInput {
    var moduleOutput: CelluralFillModuleOutput? { get }
}

protocol CelluralFillModuleOutput: AnyObject {
}

protocol CelluralFillViewInput: AnyObject {
    func configure(with model: CelluralFillViewModel)
    func fillCells(with model: CellStateViewModel)
}

protocol CelluralFillViewOutput: AnyObject {
    func didLoadView()
    func didTapActionButton()
}
