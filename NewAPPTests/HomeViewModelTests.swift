import XCTest
@testable import NewAPP

final class HomeViewModelTests: XCTestCase {
    func testDefaultContentStartsWithoutFakeBusinessData() {
        let viewModel = HomeViewModel()

        XCTAssertEqual(viewModel.storeName, "محل جديد")
        XCTAssertEqual(viewModel.title, "محلك في جيبك")
        XCTAssertFalse(viewModel.subtitle.isEmpty)
        XCTAssertEqual(viewModel.primaryActionTitle, "فاتورة جديدة")
        XCTAssertEqual(viewModel.secondaryActionTitle, "مسح باركود")
        XCTAssertEqual(viewModel.metrics.count, 3)
        XCTAssertEqual(viewModel.dailySummary.revenue, "0 دج")
        XCTAssertEqual(viewModel.healthItems.count, 0)
        XCTAssertEqual(viewModel.quickActions.count, 4)
        XCTAssertEqual(viewModel.themeOptions.count, 4)
        XCTAssertEqual(viewModel.languageOptions.count, 3)
        XCTAssertEqual(viewModel.themeOptions.first(where: { $0.isSelected })?.name, "أزرق")
        XCTAssertEqual(viewModel.languageOptions.first(where: { $0.isSelected })?.code, "AR")
        XCTAssertEqual(viewModel.features.count, 4)
        XCTAssertTrue(viewModel.features.contains { $0.title == "كاشير سريع" })
        XCTAssertTrue(viewModel.features.contains { $0.title == "تتبع المخزون" })
        XCTAssertTrue(viewModel.features.contains { $0.title == "تقارير يومية" })
        XCTAssertTrue(viewModel.features.contains { $0.title == "متابعة الديون" })
    }

    func testLocalDatabaseStartsEmptyAndPersistsSnapshot() {
        let suiteName = "NewAPPTests.LocalDatabase"
        let defaults = UserDefaults(suiteName: suiteName)!
        defaults.removePersistentDomain(forName: suiteName)
        let database = AppLocalDatabase(defaults: defaults)

        XCTAssertEqual(database.load(), LocalDatabaseSnapshot())

        var snapshot = LocalDatabaseSnapshot()
        snapshot.products.append(
            StoreProduct(
                id: UUID(),
                name: "حليب",
                price: 120,
                stock: 6,
                lowStockThreshold: 2,
                barcode: nil
            )
        )
        database.save(snapshot)

        XCTAssertEqual(database.load(), snapshot)
        defaults.removePersistentDomain(forName: suiteName)
    }
}
