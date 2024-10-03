import XCTest
@testable import Demiurge_of_Shambambukli

final class CelluralFillPresenterTests: XCTestCase {

    var presenter: CelluralFillPresenter!
    var view: MockCelluralFillViewInput!

    override func setUp() {
        super.setUp()
        presenter = CelluralFillPresenter()
        view = MockCelluralFillViewInput()
        presenter.view = view
    }

    override func tearDown() {
        presenter = nil
        view = nil
        super.tearDown()
    }

    func testDidLoadView_ConfiguresView() {
        presenter.didLoadView()

        XCTAssertTrue(view.configureCalled, "Метод configure(with:) должен быть вызван")
        XCTAssertNotNil(view.configureModel, "Модель конфигурации не должна быть nil")
    }
    
    /// Я намеренно не написал тесты с моками для проверки условий(живой, мертвой), что все соблюдается,
    /// так как не получил ответа на hh при уточнении деталей задачи.
    /// в любом случае для этого потребуется расширить презентер, чтобы у него были методы для записи и получения приватных свойств и здесь можно было добавлять моки, но так как в задаче нет конкретных деталей насчет этого, решил оставить это так
}
