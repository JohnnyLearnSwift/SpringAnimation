//
//  SpringAnimationViewController.swift
//  SpringAnimation
//
//  Created by Eugenie Tyan on 26.08.2022.
//

import UIKit
import Spring

class SpringAnimationViewController: UIViewController {
    
    private var animationSettings = AnimationSettings()
    
    @IBOutlet var springView: SpringView!
    @IBOutlet var labelPreset: UILabel!
    @IBOutlet var labelCurve: UILabel!
    @IBOutlet var labelForce: UILabel!
    @IBOutlet var labelDuration: UILabel!
    @IBOutlet var labelDelay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        springView.layer.cornerRadius = 10
        animationSettings.makeRandomSettings()
        renameLabels()
    }
    
    @IBAction func runAnimation(_ sender: SpringButton) {
        if animationSettings.currentAnimation != "" {
            springView.animation = animationSettings.currentAnimation
        }
        
        if animationSettings.currentCurve != "" {
            springView.curve = animationSettings.currentCurve
        }
        springView.force = animationSettings.currentForce
        springView.duration = animationSettings.currentDuration
        springView.delay = animationSettings.currentDelay
        springView.animate()
        renameLabels()
        sender.setTitle("Run \(animationSettings.nextAnimation)", for: .normal)
        animationSettings.makeRandomSettings()
    }
    
    private func renameLabels() {
        labelPreset.text = "Preset: \(animationSettings.currentAnimation)"
        labelCurve.text = "Curve: \(animationSettings.currentCurve)"
        labelForce.text = "Force: \(String(format:"%.3f", animationSettings.currentForce))"
        labelDuration.text = "Duration: \(String(format: "%.3f", animationSettings.currentDuration))"
        labelDelay.text = "Delay: \(String(format: "%.3f", animationSettings.currentDelay))"
    }
}
