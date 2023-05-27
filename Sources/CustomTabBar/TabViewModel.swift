// 
//  TabViewModel.swift
//  
//
//  Created by 上條栞汰 on 2023/05/10.
//

import SwiftUI
import Combine

public final class TabViewModel: ObservableObject {
    @AnimatePublished var isHidden = false
    
    public init() {}
    
    public func downTabBar(_ isHidden: Bool) {
        self.isHidden = isHidden
    }
}

@propertyWrapper
public struct AnimatePublished<Value> {
    private var value: Value
    
    public init(wrappedValue: Value) {
        value = wrappedValue
    }
    public var wrappedValue: Value {
        get { fatalError() }
        set { fatalError() }
    }
    
    public static subscript<EnclosingSelf: ObservableObject>(
        _enclosingInstance object: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, Self>
    ) -> Value {
        get {
            return object[keyPath: storageKeyPath].value
        }
        set {
            object[keyPath: storageKeyPath].value = newValue
            // 値が更新されたことを通知する
            withAnimation {
                (object.objectWillChange as? ObservableObjectPublisher)?.send()
            }
        }
    }
}

