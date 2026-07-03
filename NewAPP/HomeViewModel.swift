import Foundation

struct HomeViewModel {
    let storeName = "بقالة السلام"
    let greeting = "مساء الخير، شهاب"
    let title = "محلك في جيبك"
    let subtitle = "كاشير، مخزون، تقارير، وديون في تطبيق عربي بسيط لأصحاب المحلات الصغيرة."
    let primaryActionTitle = "فاتورة جديدة"
    let secondaryActionTitle = "مسح باركود"
    let dailySummary = DailySummary(revenue: "1,250 دج", bestSeller: "قهوة عربية", pendingDebts: "3 زبائن")
    let metrics = [
        SummaryMetric(title: "مبيعات اليوم", value: "1,250 دج", footnote: "+12% عن أمس", iconName: "banknote", tintName: "green"),
        SummaryMetric(title: "الفواتير", value: "18", footnote: "آخر فاتورة قبل 7 د", iconName: "receipt", tintName: "blue"),
        SummaryMetric(title: "ديون معلقة", value: "3", footnote: "أقرب سداد غداً", iconName: "person.crop.circle.badge.clock", tintName: "purple")
    ]
    let quickActions = [
        QuickAction(title: "بيع سريع", subtitle: "افتح الكاشير", iconName: "cart.badge.plus", tintName: "blue"),
        QuickAction(title: "منتج جديد", subtitle: "صورة وسعر", iconName: "plus.app", tintName: "green"),
        QuickAction(title: "مسح باركود", subtitle: "بالكاميرا", iconName: "barcode.viewfinder", tintName: "orange"),
        QuickAction(title: "دين جديد", subtitle: "سجل زبون", iconName: "creditcard", tintName: "purple")
    ]
    let healthItems = [
        StoreHealthItem(title: "المخزون المنخفض", value: "5 منتجات", status: "يحتاج متابعة", iconName: "exclamationmark.triangle", tintName: "orange"),
        StoreHealthItem(title: "أفضل منتج", value: "قهوة عربية", status: "الأكثر مبيعاً", iconName: "star", tintName: "green")
    ]
    let features = [
        AppFeature(
            title: "كاشير سريع",
            description: "أضف المنتجات بصورة وسعر وأنشئ الفاتورة خلال ثوانٍ.",
            iconName: "receipt",
            tintName: "blue"
        ),
        AppFeature(
            title: "تتبع المخزون",
            description: "تنبيهات عند انخفاض الكمية ومسح باركود بالكاميرا.",
            iconName: "shippingbox",
            tintName: "orange"
        ),
        AppFeature(
            title: "تقارير يومية",
            description: "اعرف ربح اليوم، أكثر منتج مبيعاً، وملخص الأسبوع أو الشهر.",
            iconName: "chart.bar.xaxis",
            tintName: "green"
        ),
        AppFeature(
            title: "متابعة الديون",
            description: "سجل الزبائن الذين يشترون بالدين وتذكير بمواعيد السداد.",
            iconName: "creditcard",
            tintName: "purple"
        )
    ]
}

struct DailySummary {
    let revenue: String
    let bestSeller: String
    let pendingDebts: String
}

struct SummaryMetric: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let footnote: String
    let iconName: String
    let tintName: String
}

struct QuickAction: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let iconName: String
    let tintName: String
}

struct StoreHealthItem: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let status: String
    let iconName: String
    let tintName: String
}

struct AppFeature: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let iconName: String
    let tintName: String
}
