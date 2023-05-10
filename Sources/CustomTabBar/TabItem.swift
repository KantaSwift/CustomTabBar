//
//  TabItem.swift
//  
//
//  Created by 上條栞汰 on 2023/05/10.
//

import SwiftUI

public struct TabItem: Identifiable, Equatable {
    public var id: Int = 0
    public let view:  AnyView
    public let imageColor: UIColor
    public let title: String?
    public let image: Image
    public let fillImage: Image
    
    public init(
        @ViewBuilder view: @escaping () -> some View,
        imageColor: UIColor,
        title: String? = nil,
        image: Image,
        fillImage: Image? = nil
    ) {
        self.view = AnyView(view())
        self.imageColor = imageColor
        self.title = title
        self.image = image
        self.fillImage = fillImage ?? image
    }
    
    public init(
        @ViewBuilder view: @escaping () -> some View,
        imageColor: UIColor,
        title: String? = nil,
        systemImageName: String,
        systemFillImageName: String? = nil
    ) {
        self.view = AnyView(view())
        self.imageColor = imageColor
        self.title = title
        self.image = Image(systemName: systemImageName)
        self.fillImage = Image(systemName: systemFillImageName ?? systemImageName)
    }
    
    public static func == (lhs: TabItem, rhs: TabItem) -> Bool {
        lhs.id == rhs.id
    }
}
