// 
//  TabView.swift
//  
//
//  Created by 上條栞汰 on 2023/05/10.
//

import SwiftUI

public struct TabView: View {
    
    @ObservedObject public var viewModel: TabViewModel
    @Binding public var selectedIndex: Int
    @State private var tabPoints = [CGFloat]()
    @Namespace private var namespace
    public let tabs: [TabItem]
    private var selectedStyle: TabBarStyle = .normal
    
    public init(
        viewModel: TabViewModel,
        tabs: [TabItem],
        selectedIndex: Binding<Int>
    ) {
        self.viewModel = viewModel
        self.tabs = tabs.enumerated().map {
            var copy = $1
            copy.id = $0
            return copy
        }
        self._selectedIndex = selectedIndex
    }
    
    public var body: some View {
        switch selectedStyle {
        case .bluge:
            blugeTabBar
        case .underLine:
            underLineTabBar
        case .normal:
            normalTabBar
        case .overLine:
            overLineTabBar
        }
    }
    
    private var blugeTabBar: some View {
        BulgeTabBar(viewModel: viewModel, selectedIndex: $selectedIndex, tabs: tabs)
    }
    
    private var underLineTabBar: some View {
        UnderLineTabBar(viewModel: viewModel, selectedIndex: $selectedIndex, tabs: tabs, namespace: namespace)
    }
    
    private var normalTabBar: some View {
        NormalTabBar(viewModel: viewModel, selectedIndex: $selectedIndex, tabs: tabs)
    }
    
    private var overLineTabBar: some View {
        OverLineTabBar(viewModel: viewModel, selectedIndex: $selectedIndex, tabs: tabs, namespace: namespace)
    }
    
    public func tabStyle(_ tabBarStyle: TabBarStyle) -> some View {
        var copy = self
        copy.selectedStyle = tabBarStyle
        return copy
    }
}
