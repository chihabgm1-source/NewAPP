# NewAPP

NewAPP is an Arabic-first iOS app for small shop owners who want to run daily sales, inventory, reports, and customer debts from their phone without a computer or complicated setup.

## Product direction

The app helps small retail shops manage core operations in a simple mobile workflow:

- Fast cashier flow for creating invoices in seconds
- Product management with photos, prices, and barcode scanning
- Inventory tracking with low-stock alerts
- Daily, weekly, and monthly sales summaries
- Customer debt tracking with repayment reminders

## Initial design direction

The current SwiftUI starter experience presents a polished Arabic dashboard for a small shop owner:

- Right-to-left Arabic interface
- Warm shop greeting and store identity header
- Large hero card with quick invoice and barcode actions
- Daily metric cards for sales, invoices, and pending debts
- Quick action grid for cashier, products, barcode scanning, and debts
- Store health alerts for low stock and best-selling products
- Reusable visual theme tokens in `AppTheme.swift`

## Requirements

- macOS with Xcode 15 or newer
- [XcodeGen](https://github.com/yonaskolb/XcodeGen)

Install XcodeGen with Homebrew:

```sh
brew install xcodegen
```

## Getting started

Generate the Xcode project:

```sh
xcodegen generate
```

Open the generated project:

```sh
open NewAPP.xcodeproj
```

Then run the `NewAPP` scheme from Xcode on an iOS simulator.

## Project structure

```text
NewAPP/
  AppTheme.swift         Visual design tokens and card styling
  NewAPPApp.swift        App entry point
  ContentView.swift      Main SwiftUI dashboard screen
  HomeViewModel.swift    Initial product state and dashboard content
  Assets.xcassets/       App assets

NewAPPTests/
  HomeViewModelTests.swift

project.yml              XcodeGen project definition
```
