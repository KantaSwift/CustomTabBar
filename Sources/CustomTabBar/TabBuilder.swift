// 
//  TabBuilder.swift
//  
//
//  Created by 上條栞汰 on 2023/05/10.
//

import Foundation

@resultBuilder
public enum TabBuilder {
    public static func buildEither(first component: [TabItem]) -> [TabItem] {
        component
    }
    
    public static func buildEither(second component: [TabItem]) -> [TabItem] {
        component
    }
    
    public  static func buildOptional(_ component: [TabItem]?) -> [TabItem] {
        component ?? []
    }
    
    public static func buildExpression(_ expression: TabItem) -> [TabItem] {
        [expression]
    }
    
    public  static func buildExpression(_: ()) -> [TabItem] {
        []
    }
    
    public static func buildBlock(_ components: [TabItem]...) -> [TabItem] {
        components.flatMap { $0 }
    }
}
