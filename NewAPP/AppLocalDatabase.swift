import Foundation

struct StoreProduct: Codable, Identifiable, Equatable {
    let id: UUID
    var name: String
    var price: Double
    var stock: Int
    var lowStockThreshold: Int
    var barcode: String?
}

struct SaleRecord: Codable, Identifiable, Equatable {
    let id: UUID
    var date: Date
    var items: [SaleItem]
    var total: Double
}

struct SaleItem: Codable, Equatable {
    var productId: UUID
    var productName: String
    var quantity: Int
    var unitPrice: Double
}

struct CustomerDebt: Codable, Identifiable, Equatable {
    let id: UUID
    var customerName: String
    var amount: Double
    var dueDate: Date?
    var isPaid: Bool
}

struct AppSettings: Codable, Equatable {
    var themeName: String = "blue"
    var languageCode: String = "ar"
}

struct LocalDatabaseSnapshot: Codable, Equatable {
    var products: [StoreProduct] = []
    var sales: [SaleRecord] = []
    var debts: [CustomerDebt] = []
    var settings = AppSettings()
}

final class AppLocalDatabase {
    private let storageKey = "newapp.local.database"
    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func load() -> LocalDatabaseSnapshot {
        guard let data = defaults.data(forKey: storageKey) else {
            return LocalDatabaseSnapshot()
        }

        return (try? JSONDecoder().decode(LocalDatabaseSnapshot.self, from: data)) ?? LocalDatabaseSnapshot()
    }

    func save(_ snapshot: LocalDatabaseSnapshot) {
        guard let data = try? JSONEncoder().encode(snapshot) else {
            return
        }

        defaults.set(data, forKey: storageKey)
    }
}
