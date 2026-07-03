import XCTest
@testable import NewAPP

final class HomeViewModelTests: XCTestCase {
    func testDefaultContentIsPresentable() {
        let viewModel = HomeViewModel()

        XCTAssertEqual(viewModel.storeName, "بقالة السلام")
        XCTAssertEqual(viewModel.title, "محلك في جيبك")
        XCTAssertFalse(viewModel.subtitle.isEmpty)
        XCTAssertEqual(viewModel.primaryActionTitle, "فاتورة جديدة")
        XCTAssertEqual(viewModel.secondaryActionTitle, "مسح باركود")
        XCTAssertEqual(viewModel.metrics.count, 3)
        XCTAssertEqual(viewModel.quickActions.count, 4)
        XCTAssertEqual(viewModel.themeOptions.count, 4)
        XCTAssertEqual(viewModel.languageOptions.count, 3)
        XCTAssertEqual(viewModel.themeOptions.first(where: { $0.isSelected })?.name, "أزرق")
        XCTAssertEqual(viewModel.languageOptions.first(where: { $0.isSelected })?.code, "AR")
        XCTAssertEqual(viewModel.healthItems.count, 2)
        XCTAssertEqual(viewModel.features.count, 4)
        XCTAssertFalse(viewModel.dailySummary.revenue.isEmpty)
        XCTAssertTrue(viewModel.features.contains { $0.title == "كاشير سريع" })
        XCTAssertTrue(viewModel.features.contains { $0.title == "تتبع المخزون" })
        XCTAssertTrue(viewModel.features.contains { $0.title == "تقارير يومية" })
        XCTAssertTrue(viewModel.features.contains { $0.title == "متابعة الديون" })
        XCTAssertTrue(viewModel.quickActions.contains { $0.title == "بيع سريع" })
        XCTAssertTrue(viewModel.quickActions.contains { $0.title == "مسح باركود" })
    }
}
