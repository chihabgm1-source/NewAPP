import SwiftUI

struct ContentView: View {
    let viewModel: HomeViewModel
    private let metricColumns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.background.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .trailing, spacing: 24) {
                        headerSection
                        heroSection
                        metricsSection
                        quickActionsSection
                        storeHealthSection
                        featuresSection
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 18)
                }
            }
            .environment(\.layoutDirection, .rightToLeft)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    private var headerSection: some View {
        HStack(spacing: 14) {
            Button(action: {}) {
                Image(systemName: "bell.badge")
                    .font(.headline)
                    .foregroundStyle(AppTheme.ink)
                    .frame(width: 44, height: 44)
                    .background(.white, in: Circle())
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 6)
            }
            .accessibilityLabel("التنبيهات")

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text(viewModel.greeting)
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.muted)

                Text(viewModel.storeName)
                    .font(.title2.weight(.bold))
                    .foregroundStyle(AppTheme.ink)
            }

            Text("م")
                .font(.title3.weight(.bold))
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(AppTheme.primaryDark, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }

    private var heroSection: some View {
        VStack(alignment: .trailing, spacing: 20) {
            HStack(alignment: .top) {
                Image(systemName: "storefront.fill")
                    .font(.system(size: 34, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 70, height: 70)
                    .background(.white.opacity(0.16), in: RoundedRectangle(cornerRadius: 24, style: .continuous))
                    .accessibilityHidden(true)

                Spacer()

                VStack(alignment: .trailing, spacing: 8) {
                    Text(viewModel.title)
                        .font(.largeTitle.weight(.black))
                        .foregroundStyle(.white)

                    Text(viewModel.subtitle)
                        .font(.callout)
                        .foregroundStyle(.white.opacity(0.78))
                        .multilineTextAlignment(.trailing)
                        .lineSpacing(4)
                }
            }

            HStack(spacing: 12) {
                Button(viewModel.secondaryActionTitle, systemImage: "barcode.viewfinder") {}
                    .buttonStyle(SecondaryHeroButtonStyle())

                Button(viewModel.primaryActionTitle, systemImage: "plus") {}
                    .buttonStyle(PrimaryHeroButtonStyle())
            }
        }
        .padding(22)
        .background(
            LinearGradient(
                colors: [AppTheme.primaryDark, AppTheme.primary],
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            ),
            in: RoundedRectangle(cornerRadius: 32, style: .continuous)
        )
        .overlay(alignment: .bottomLeading) {
            Circle()
                .fill(.white.opacity(0.10))
                .frame(width: 130, height: 130)
                .offset(x: -34, y: 38)
        }
        .shadow(color: AppTheme.primary.opacity(0.25), radius: 24, x: 0, y: 18)
    }

    private var metricsSection: some View {
        VStack(alignment: .trailing, spacing: 14) {
            SectionTitle(title: "ملخص اليوم", subtitle: "أرقام سريعة تساعدك تتخذ القرار")

            LazyVGrid(columns: metricColumns, spacing: 12) {
                ForEach(viewModel.metrics) { metric in
                    MetricCard(metric: metric)
                }
            }
        }
    }

    private var quickActionsSection: some View {
        VStack(alignment: .trailing, spacing: 14) {
            SectionTitle(title: "إجراءات سريعة", subtitle: "كل ما يحتاجه صاحب المحل بضغطة")

            LazyVGrid(columns: metricColumns, spacing: 12) {
                ForEach(viewModel.quickActions) { action in
                    QuickActionCard(action: action)
                }
            }
        }
    }

    private var storeHealthSection: some View {
        VStack(alignment: .trailing, spacing: 14) {
            SectionTitle(title: "حالة المحل", subtitle: "تنبيهات مهمة قبل نهاية اليوم")

            VStack(spacing: 12) {
                ForEach(viewModel.healthItems) { item in
                    StoreHealthRow(item: item)
                }
            }
        }
    }

    private var featuresSection: some View {
        VStack(alignment: .trailing, spacing: 14) {
            SectionTitle(title: "الأقسام الرئيسية", subtitle: "النسخة الأولى مبنية حول هذه الأدوات")

            VStack(spacing: 12) {
                ForEach(viewModel.features) { feature in
                    FeatureRow(feature: feature)
                }
            }
        }
    }
}

private struct SectionTitle: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .trailing, spacing: 3) {
            Text(title)
                .font(.headline.weight(.bold))
                .foregroundStyle(AppTheme.ink)

            Text(subtitle)
                .font(.caption)
                .foregroundStyle(AppTheme.muted)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

private struct MetricCard: View {
    let metric: SummaryMetric

    var body: some View {
        VStack(alignment: .trailing, spacing: 12) {
            HStack {
                Image(systemName: metric.iconName)
                    .font(.headline)
                    .foregroundStyle(tintColor)
                    .frame(width: 36, height: 36)
                    .background(tintColor.opacity(0.12), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .accessibilityHidden(true)

                Spacer()
            }

            VStack(alignment: .trailing, spacing: 4) {
                Text(metric.value)
                    .font(.title3.weight(.bold))
                    .foregroundStyle(AppTheme.ink)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)

                Text(metric.title)
                    .font(.caption)
                    .foregroundStyle(AppTheme.muted)

                Text(metric.footnote)
                    .font(.caption2.weight(.medium))
                    .foregroundStyle(tintColor)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 142, alignment: .topTrailing)
        .padding(16)
        .appCard()
    }

    private var tintColor: Color { AppTint.color(named: metric.tintName) }
}

private struct QuickActionCard: View {
    let action: QuickAction

    var body: some View {
        VStack(alignment: .trailing, spacing: 14) {
            Image(systemName: action.iconName)
                .font(.title3.weight(.bold))
                .foregroundStyle(.white)
                .frame(width: 42, height: 42)
                .background(AppTint.color(named: action.tintName), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                .accessibilityHidden(true)

            VStack(alignment: .trailing, spacing: 4) {
                Text(action.title)
                    .font(.headline)
                    .foregroundStyle(AppTheme.ink)

                Text(action.subtitle)
                    .font(.caption)
                    .foregroundStyle(AppTheme.muted)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 128, alignment: .topTrailing)
        .padding(16)
        .appCard()
    }
}

private struct StoreHealthRow: View {
    let item: StoreHealthItem

    var body: some View {
        HStack(spacing: 14) {
            VStack(alignment: .trailing, spacing: 4) {
                Text(item.title)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(AppTheme.ink)

                Text(item.status)
                    .font(.caption)
                    .foregroundStyle(AppTheme.muted)
            }

            Spacer()

            Text(item.value)
                .font(.subheadline.weight(.bold))
                .foregroundStyle(tintColor)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(tintColor.opacity(0.10), in: Capsule())

            Image(systemName: item.iconName)
                .font(.headline)
                .foregroundStyle(tintColor)
                .frame(width: 42, height: 42)
                .background(tintColor.opacity(0.12), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                .accessibilityHidden(true)
        }
        .padding(16)
        .appCard()
    }

    private var tintColor: Color { AppTint.color(named: item.tintName) }
}

private struct FeatureRow: View {
    let feature: AppFeature

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            VStack(alignment: .trailing, spacing: 5) {
                Text(feature.title)
                    .font(.headline)
                    .foregroundStyle(AppTheme.ink)

                Text(feature.description)
                    .font(.subheadline)
                    .foregroundStyle(AppTheme.muted)
                    .multilineTextAlignment(.trailing)
                    .lineSpacing(3)
            }

            Image(systemName: feature.iconName)
                .font(.title3.weight(.semibold))
                .foregroundStyle(tintColor)
                .frame(width: 46, height: 46)
                .background(tintColor.opacity(0.13), in: RoundedRectangle(cornerRadius: 15, style: .continuous))
                .accessibilityHidden(true)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(16)
        .appCard()
    }

    private var tintColor: Color { AppTint.color(named: feature.tintName) }
}

private enum AppTint {
    static func color(named name: String) -> Color {
        switch name {
        case "green":
            return AppTheme.success
        case "orange":
            return AppTheme.warning
        case "purple":
            return AppTheme.purple
        case "red":
            return AppTheme.danger
        default:
            return AppTheme.primary
        }
    }
}

private struct PrimaryHeroButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline.weight(.bold))
            .foregroundStyle(AppTheme.primaryDark)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(.white.opacity(configuration.isPressed ? 0.82 : 1), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}

private struct SecondaryHeroButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline.weight(.bold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(.white.opacity(configuration.isPressed ? 0.12 : 0.18), in: RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}

#Preview {
    ContentView(viewModel: HomeViewModel())
}
