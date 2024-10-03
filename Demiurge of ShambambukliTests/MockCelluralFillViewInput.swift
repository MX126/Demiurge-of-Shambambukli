@testable import Demiurge_of_Shambambukli

class MockCelluralFillViewInput: CelluralFillViewInput {
    var configureCalled = false
    var configureModel: CelluralFillViewModel?

    var fillCellsCalled = false
    var fillCellsModels: [CellStateViewModel] = []

    func configure(with model: CelluralFillViewModel) {
        configureCalled = true
        configureModel = model
    }

    func fillCells(with model: CellStateViewModel) {
        fillCellsCalled = true
        fillCellsModels.append(model)
    }

    func reloadData() {
    }
}
