//
//  ViewController.swift
//  Counter
//
//  Created by Maxim Bazarov on 28.12.18.
//  Copyright © 2018 Unicore. All rights reserved.
//

import UIKit
import Unicore

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    private let disposer = Disposer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        core.observe(on: .main) { (state) in
            self.counterLabel.text = String(state.counter)
        }.dispose(on: disposer)
        core.dispatch(ScreenShown(name: "Main Screen"))
    }

    @IBAction func increase(_ sender: Any) {
        core.dispatch(CounterIncreaseRequested())
    }
    
    @IBAction func decrease(_ sender: Any) {
        core.dispatch(CounterDecreaseRequested())
    }
}

