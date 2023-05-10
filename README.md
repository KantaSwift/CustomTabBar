# CustomTabBar
![Language:Swift](https://img.shields.io/static/v1?label=Language&message=Swift&color=green&style=flat-square)
[![License](https://img.shields.io/github/license/KantaSwift/CustomTabBar)](https://github.com/KantaSwift/CustomTabBar/blob/main/LICENSE)
[![Twitter](https://img.shields.io/twitter/follow/KantaSwift?style=social)](https://twitter.com/kanta_Swift)

#### You can easily use the stylish TabBar!

## Table of Contents

- [Installation](#installation)
- [Basic Usage](#basic-usage)
- [Tab Style](#tab-style)
- [Contribution](#contribution)


## Installation

### Swift Package Manager 

#### Package

You can add this package to `Package.swift`, include it in your target dependencies.

```
let package = Package(
    dependencies: [
        .package(url: "https://github.com/KantaSwift/CustomTabBar.git", .upToNextMajor(from: "0.1.0")),
    ],
    targets: [
        .target(
            name: "<your-target-name>",
            dependencies: ["CustomTabBar"]),
    ]
)
```

#### Xcode

You can add this package on Xcode.
See [documentation](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app).

## Basic Usage
The following is a sample code

```swift
 import CustomTabBar
   
 @State var selectedIndex: Int
 @StateObject var viewModel = TabViewModel()
    
 var body: some View {
     TabView(viewModel: viewModel, tabs: tabItems, selectedIndex: $selectedIndex)
 }
    
 @TabBuilder
 private var tabItems: [TabItem] {
     TabItem(
         view: {
             HogeView(viewModel: viewModel)
         },
         imageColor: .cyan,
         title: "Home",
         image: Image(systemName: "house"),
         fillImage: Image(systemName: "house.fill")
     )
     TabItem(
         view: {
            FugaView(viewModel: viewModel)
         },
         imageColor: .red,
         title: "Search",
         image: Image(systemName: "magnifyingglass")
     )
  }
```

## Tab Style
There are four different TabBars available! 

### Usage
You can specify tabStyle as follows. The default is normal.
```swift
  TabView(viewModel: viewModel, tabs: tabItems, selectedIndex: $selectedIndex)
            .tabStyle(.bluge)
```
| normal | bluge | underLine | overLine |
|--------|-------|--------|-------|
| <img src="https://github.com/KantaSwift/CustomTabBar/assets/101320551/221b15d6-eeef-4c96-baee-4b363d96109a" width="180"> | <img src="https://github.com/KantaSwift/CustomTabBar/assets/101320551/16c485ab-52de-47d8-b398-1a594c3231fd" width="180"> | <img src="https://github.com/KantaSwift/CustomTabBar/assets/101320551/e00a6836-8f66-4f66-b9f6-f49bc6f1b093" width="180"> | <img src="https://github.com/KantaSwift/CustomTabBar/assets/101320551/7994374a-badf-44a8-a1f5-5691da4ac55f" width="180"> |  

※ You may not like the animation that is attached to the screen when you press Tab to switch screens. We will respond as soon as we find the cause of the problem.


## Contribution
I would be happy if you contribute :)

- [New issue](https://github.com/KantaSwift/CustomTabBar/issues/new)
- [New pull request](https://github.com/KantaSwift/CustomTabBar/compare)



