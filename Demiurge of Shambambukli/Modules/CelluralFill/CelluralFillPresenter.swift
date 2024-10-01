import Foundation

final class CelluralFillPresenter {
    // MARK: - Properties
    
    weak var view: CelluralFillViewInput?
    weak var moduleOutput: CelluralFillModuleOutput?
}

// MARK: - CelluralFillModuleInput

extension CelluralFillPresenter: CelluralFillModuleInput {
}

// MARK: - CelluralFillViewOutput

extension CelluralFillPresenter: CelluralFillViewOutput {
    func didLoadView() {
        let model = CelluralFillViewModel()
        view?.configure(with: model)
    }
}
