import UIKit

final class CelluralFillViewController: UIViewController {
    // MARK: - Private properties
    
    private let output: CelluralFillViewOutput
    
    private lazy var blurGradientView = BlurGradientView(frame: view.bounds,
                                                         gradientColors: [UIColor.purple, UIColor.black])
    private let labelTitle = UILabel()
    private let tableView = UITableView()
    private let actionButton = UIButton(type: .system)
    
    private var cells: [CelluralFillCellState] = []
    
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
        
        output.didLoadView()
        
        setup()
        addSubviews()
        makeConstraints()
    }
    
    // MARK: - Actions
    
    @objc func didTapActionButton() {
        output.didTapActionButton()
    }
}

// MARK: - Setup

private extension CelluralFillViewController {
    func setup() {
        blurGradientView.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        setupTableView()
        setupActionButton()
    }
    
    func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.register(CelluralFillCell.self, forCellReuseIdentifier: String(describing: CelluralFillCell.self))
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupActionButton() {
        actionButton.backgroundColor = .systemPurple
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.layer.cornerRadius = Constants.actionButtonCornerRadius
        actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
    }
    
    func addSubviews() {
        view.addSubviews(blurGradientView, labelTitle, actionButton, tableView)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            blurGradientView.topAnchor.constraint(equalTo: view.topAnchor),
            blurGradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurGradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurGradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            labelTitle.topAnchor.constraint(equalTo: blurGradientView.safeAreaLayoutGuide.topAnchor),
            labelTitle.centerXAnchor.constraint(equalTo: blurGradientView.centerXAnchor),
            
            actionButton.bottomAnchor.constraint(equalTo: blurGradientView.safeAreaLayoutGuide.bottomAnchor,
                                                 constant: Constants.actionButtonBottomOffset),
            actionButton.centerXAnchor.constraint(equalTo: blurGradientView.centerXAnchor),
            actionButton.leadingAnchor.constraint(equalTo: blurGradientView.safeAreaLayoutGuide.leadingAnchor,
                                                  constant: Constants.actionButtonCornerOffset),
            actionButton.trailingAnchor.constraint(equalTo: blurGradientView.safeAreaLayoutGuide.trailingAnchor,
                                                   constant: -Constants.actionButtonCornerOffset),
            actionButton.heightAnchor.constraint(equalToConstant: Constants.actionButtonHeight),
            
            tableView.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: Constants.tableViewTopOffset),
            tableView.leadingAnchor.constraint(equalTo: blurGradientView.safeAreaLayoutGuide.leadingAnchor,
                                               constant: Constants.tableViewCornerOffset),
            tableView.trailingAnchor.constraint(equalTo: blurGradientView.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -Constants.tableViewCornerOffset),
            tableView.bottomAnchor.constraint(equalTo: actionButton.topAnchor,
                                              constant: -Constants.tableViewBottomOffset),
            
        ])
    }
}

// MARK: - CelluralFillViewInput

extension CelluralFillViewController: CelluralFillViewInput {
    func configure(with model: CelluralFillViewModel) {
        actionButton.setTitle(model.actionButtonTitle, for: .normal)
        labelTitle.attributedText = model.labelTitle
    }
    
    func fillCells(with model: CellStateViewModel) {
        let oldCellCount = cells.count
        cells = model.cells
        
        tableView.beginUpdates()
        
        if cells.count > oldCellCount {
            let newIndexPaths = (oldCellCount..<cells.count).map { IndexPath(row: $0, section: 0) }
            tableView.insertRows(at: newIndexPaths, with: .automatic)
        } else {
            tableView.reloadData()
        }
        
        tableView.endUpdates()
        
        if !tableView.isDragging && !tableView.isDecelerating && cells.count > 0 {
            let lastRowIndex = cells.count - 1
            let lastIndexPath = IndexPath(row: lastRowIndex, section: 0)
            tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource

extension CelluralFillViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CelluralFillCell.self), for: indexPath) as? CelluralFillCell else {
            return UITableViewCell()
        }
        
        let cellState = cells[indexPath.row]
        cell.configure(with: cellState)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CelluralFillViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableViewCellHeight
    }
}

// MARK: - Constants

private extension CelluralFillViewController {
    enum Constants {
        static let actionButtonBottomOffset: CGFloat = -16
        static let actionButtonCornerOffset: CGFloat = 14
        static let actionButtonCornerRadius: CGFloat = 6
        static let actionButtonHeight: CGFloat = 36
        
        static let tableViewTopOffset: CGFloat = 10
        static let tableViewCornerOffset: CGFloat = 16
        static let tableViewBottomOffset: CGFloat = 10
        static let tableViewCellHeight: CGFloat = 90
    }
}
