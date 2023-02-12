//
//  UIState.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

import Foundation

enum UIState<T> {
    case loading
    case success(T)
    case failed(String)
}
