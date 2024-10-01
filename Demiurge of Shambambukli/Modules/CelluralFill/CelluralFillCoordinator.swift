import UIKit

final class CelluralFillCoordinator: BaseCoordinator {
    // MARK: - Private properties
    
    private var navigationController: UINavigationController
    
    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Overrides
    
    override func start() {
        let celluralFillViewController = CelluralFillContainer.assemble(with: .init()).viewController
        navigationController.pushViewController(celluralFillViewController, animated: true)
    }
}
