# NewAPP

NewAPP is an Arabic-first iOS app for small shop owners who want to run daily sales, inventory, reports, and customer debts from their phone without a computer or complicated setup.

## Product direction

The app helps small retail shops manage core operations in a simple mobile workflow:

- Fast cashier flow for creating invoices in seconds
- Product management with photos, prices, stock, and barcode fields
- Product photos shown in product lists, inventory, and cashier sale flow
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
- Local database model for products, sales, debts, and settings
- Theme color selection with blue, green, purple, and orange options inside Settings
- Language selection with Arabic, English, and French options inside Settings
- Store health alerts based on real local data instead of seeded demo values
- Reusable visual theme tokens in `AppTheme.swift`

## Try without a Mac

A browser-based preview is available for reviewing the current app design without Xcode or an iOS Simulator.

Open this file in any browser:

```text
Preview/index.html
```

The preview now behaves like a small local app on the phone:

- Data is stored locally in the browser with `localStorage`
- The app starts without fake products, sales, debts, or inventory
- The `|||` menu opens all app sections
- Settings are placed at the bottom of the menu
- Theme and language selection live only in Settings
- Cashier, products, inventory, reports, debts, and settings are interactive
- Product images can be selected from the phone and are saved locally with the product

## Requirements for the native iOS app

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
  AppLocalDatabase.swift Local persistence models and storage
  AppTheme.swift         Visual design tokens and card styling
  NewAPPApp.swift        App entry point
  ContentView.swift      Main SwiftUI dashboard screen
  HomeViewModel.swift    Initial product state and dashboard content
  Assets.xcassets/       App assets

NewAPPTests/
  HomeViewModelTests.swift

Preview/
  index.html             Browser preview for testing without a Mac

project.yml              XcodeGen project definition
```
