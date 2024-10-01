import UIKit

final class AppCoordinator: BaseCoordinator {
    // MARK: - Private properties
    
    private var window: UIWindow
    private var navigationController: UINavigationController = {
        UINavigationController()
    }()
    
    // MARK: - Lifecycle
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    // MARK: - Overrides
    
    override func start() {
        let celluralFillCoordinator = CelluralFillCoordinator(navigationController: navigationController)
        
        add(coordinator: celluralFillCoordinator)
        celluralFillCoordinator.start()
    }
}

