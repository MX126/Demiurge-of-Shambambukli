import Foundation

final class CelluralFillPresenter {
    // MARK: - Properties
    
    weak var view: CelluralFillViewInput?
    weak var moduleOutput: CelluralFillModuleOutput?
    
    private var cells: [CelluralFillCellState] = []
    private var lastStates: [CelluralFillCellState] = []
}

// MARK: - CelluralFillModuleInput

extension CelluralFillPresenter: CelluralFillModuleInput {
}

// MARK: - CelluralFillViewOutput

extension CelluralFillPresenter: CelluralFillViewOutput {
    func didChangedCellState() {
        view?.reloadData()
    }
    
    func didTapActionButton() {
        var newState: CelluralFillCellState

        if lastStates.count == 3 {
            if lastStates.allSatisfy({ $0 == .lively }) {
                newState = .life
            } else if lastStates.allSatisfy({ $0 == .dead }) {
                if let index = cells.lastIndex(where: { $0 == .life }) {
                    cells[index] = .dead
                }
                didChangedCellState()
                newState = CelluralFillCellState.randomState()
            } else {
                newState = CelluralFillCellState.randomState()
            }
            lastStates.removeFirst()
        } else {
            newState = CelluralFillCellState.randomState()
        }

        lastStates.append(newState)
        cells.append(newState)

        let viewModel = CellStateViewModel(
            cells: cells
        )
        
        DispatchQueue.main.async {
            self.view?.fillCells(with: viewModel)
        }
    }
    
    func didLoadView() {
        let model = CelluralFillViewModel()
        view?.configure(with: model)
    }
}
