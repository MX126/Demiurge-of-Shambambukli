import UIKit

final class CelluralFillContainer {
    // MARK: - Properties
    
    let input: CelluralFillModuleInput
    let viewController: UIViewController
    
    // MARK: - Assemble
    
    class func assemble(with context: CelluralFillContext) -> CelluralFillContainer {
        let presenter = CelluralFillPresenter()
        let viewController = CelluralFillViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        return CelluralFillContainer(view: viewController, input: presenter)
    }
    
    // MARK: - Lifecycle
    
    private init(view: UIViewController, input: CelluralFillModuleInput) {
        self.viewController = view
        self.input = input
    }
}

struct CelluralFillContext {
    weak var moduleOutput: CelluralFillModuleOutput?
}
