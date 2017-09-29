//
//  PredixTimeSeriesView+IBInspectable.swift
//  PredixMobileUIKit
//
//  Created by 212460388 (GE Digital) on 9/28/17.
//  Copyright © 2017 GE. All rights reserved.
//

import Foundation
import Charts

extension PredixTimeSeriesView {
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        liveDebugLog("TimeSeries: inside prepareForInterfaceBuilder")
        initializeWithDummyData()
        self.legend.calculateDimensions(labelFont: self.legend.font, viewPortHandler: self.viewPortHandler)
    }
    
    private func initializeWithDummyData() -> Void {
        var tags: [TimeSeriesTag] = []
//        let upperRange = 10000
//        let lowerRange = 1000
        let upperRange = 2017
        let lowerRange = 2017 - 10
        liveDebugLog("TimeSeries: inside initializeWithDummyData")
        for i in 1...5 {
            var dataPoints: [TimeSeriesDataPoint] = []
            for j in 0...10 {
                
//                let time = (Date().timeIntervalSince1970 + Double((arc4random_uniform(UInt32(upperRange - lowerRange)) + UInt32(lowerRange) )) ) / 100000000
                let time = (arc4random_uniform(UInt32(upperRange - lowerRange)) + UInt32(lowerRange) )
                let measure = Double((arc4random_uniform(UInt32(8)) + UInt32(j)) )
                let dataPoint = TimeSeriesDataPoint(epochInMs: Double(time), measure: measure)
                liveDebugLog("TimeSeries: initializeWithDummyData: dataPoint created")
                dataPoints.append(dataPoint)
            }
            let tag = TimeSeriesTag(name: "TAG_\(i)", dataPoints: dataPoints)
            tags.append(tag)
            liveDebugLog("TimeSeries: initializeWithDummyData: tag added")
        }
        loadLabelsAndValues(with: tags)
    }
    
    @IBInspectable
    var labelText: String? {
        get {
            return self.chartDescription?.text
        }
        set(newValue) {
            self.chartDescription?.text = newValue
        }
    }
    
    @IBInspectable
    var labelEnabled: Bool {
        get {
            return chartDescription?.enabled ?? false
        }
        set(newValue) {
            chartDescription?.enabled = newValue
        }
        
    }
    
    @IBInspectable
    var legendHorizontalAlignment: Int {
        get {
            return self.legend.horizontalAlignment.rawValue
        }
        set(newValue) {
            if let alignment = Legend.HorizontalAlignment(rawValue: newValue) {
                self.legend.horizontalAlignment = alignment
            }
        }
    }
    
    @IBInspectable
    var legendVerticalAlignment: Int {
        get {
            return self.legend.verticalAlignment.rawValue
        }
        set(newValue) {
            if let alignment = Legend.VerticalAlignment(rawValue: newValue) {
                self.legend.verticalAlignment = alignment
            }
        }
    }
    
    @IBInspectable
    var legendVerticalOrientation: Bool {
        get {
            return self.legend.orientation == .vertical
        }
        set(newValue) {
            if newValue {
                self.legend.orientation = .vertical
            } else {
                self.legend.orientation = .horizontal
            }
        }
    }
    @IBInspectable
    var legendKeyOnLeft: Bool {
        get {
            return self.legend.direction == .leftToRight
        }
        set(newValue) {
            if newValue {
                self.legend.direction = .leftToRight
            } else {
                self.legend.direction = .rightToLeft
            }
        }
    }
    
    @IBInspectable
    var legendAllowOverlap: Bool {
        get {
            return self.legend.drawInside
        }
        set(newValue) {
            self.legend.drawInside = newValue
        }
    }
    
    @IBInspectable open var leftAxisEnabled: Bool {
        get {
            return leftAxis.enabled
        }
        set(newValue) {
            leftAxis.enabled = newValue
        }
    }
    
    @IBInspectable
    var rightAxisEnabled: Bool {
        get {
            return rightAxis.enabled
        }
        set(newValue) {
            rightAxis.enabled = newValue
        }
    }
    
    @IBInspectable
    var legendLeft: Bool {
        get {
            return legend.horizontalAlignment == .left
        }
        set(newValue) {
            if newValue {
                legend.horizontalAlignment = .left
            } else {
                legend.horizontalAlignment = .right
            }
        }
        
    }
    
    @IBInspectable
    var legendTop: Bool {
        get {
            return legend.verticalAlignment == .top
        }
        set(newValue) {
            if newValue {
                legend.verticalAlignment = .top
            } else {
                legend.verticalAlignment = .bottom
            }
        }
    }
 
    @IBInspectable
    var dataSets: Int {
        get {
            initializeWithDummyData()
            return 1
        }
    }

    
 
}
