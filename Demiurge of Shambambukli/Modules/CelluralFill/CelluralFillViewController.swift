import UIKit

final class CelluralFillViewController: UIViewController {
    // MARK: - Private properties
    
    private let output: CelluralFillViewOutput

    // MARK: - Lifecycle
    
    init(output: CelluralFillViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) не был реализован")
    }

    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

// MARK: - CelluralFillViewInput

extension CelluralFillViewController: CelluralFillViewInput {
}
