//
//  AsyncUtil.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class AsyncUtil {
    static func onMainThread(_ block: @escaping () -> Void, delay: Double) {
        if delay == 0.0 {
            DispatchQueue.main.async {
                block()
            }
            return
        }
        
        let d = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: d) {
            block()
        }
    }
}
