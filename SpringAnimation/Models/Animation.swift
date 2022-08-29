//
//  Animation.swift
//  SpringAnimation
//
//  Created by Eugenie Tyan on 26.08.2022.
//

import CoreGraphics

struct AnimationSettings {
    var currentAnimation: String
    var nextAnimation: String
    var currentCurve: String
    var currentForce: Double
    var currentDuration: Double
    var currentDelay: Double
    
    private let animationsPreset = AnimationPresetList.allCases
    private let animationsCurve = AnimationCurveList.allCases
    
    init() {
        currentAnimation = animationsPreset.randomElement()?.rawValue ?? ""
        currentCurve = animationsCurve.randomElement()?.rawValue ?? ""
        currentForce = Double.random(in: 1...2)
        currentDuration = Double.random(in: 0...1)
        currentDelay = Double.random(in: 0...1)
        nextAnimation = animationsPreset.randomElement()?.rawValue ?? ""
    }
    
    mutating func makeRandomSettings() {
        if currentAnimation == "" {
            currentAnimation = animationsPreset.randomElement()?.rawValue ?? ""
        } else {
            currentAnimation = nextAnimation
        }
        currentCurve = animationsCurve.randomElement()?.rawValue ?? ""
        currentForce = Double.random(in: 1...2)
        currentDuration = Double.random(in: 0...1)
        currentDelay = Double.random(in: 0...1)
        nextAnimation = animationsPreset.randomElement()?.rawValue ?? ""
    }
}
enum AnimationPresetList: String, CaseIterable {
    case slideLeft
    case slideRight
    case slideDown
    case slideUp
    case squeezeLeft
    case squeezeRight
    case squeezeDown
    case squeezeUp
    case fadeIn
    case fadeOut
    case fadeOutIn
    case fadeInLeft
    case fadeInRight
    case fadeInDown
    case fadeInUp
    case zoomIn
    case zoomOut
    case fall
    case shake
    case pop
    case flipX
    case flipY
    case morph
    case squeeze
    case flash
    case wobble
    case swing
}

enum AnimationCurveList: String, CaseIterable {
    case easeIn
    case easeOut
    case easeInOut
    case linear
    case spring
    case easeInSine
    case easeOutSine
    case easeInOutSine
    case easeInQuad
    case easeOutQuad
    case easeInOutQuad
    case easeInCubic
    case easeOutCubic
    case easeInOutCubic
    case easeInQuart
    case easeOutQuart
    case easeInOutQuart
    case easeInQuint
    case easeOutQuint
    case easeInOutQuint
    case easeInExpo
    case easeOutExpo
    case easeInOutExpo
    case easeInCirc
    case easeOutCirc
    case easeInOutCirc
    case easeInBack
    case easeOutBack
    case easeInOutBack
}
