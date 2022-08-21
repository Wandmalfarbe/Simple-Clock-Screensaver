//
//  MainViewController.swift
//  SimpleClock
//
//  Created by Pascal Wagler on 05/08/16.
//  Copyright (c) 2016 - 2018 Pascal Wagler. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    
    @IBOutlet weak var clockView: SimpleClock!
    @IBOutlet weak var clockSizeSlider: NSSlider!
    @IBOutlet weak var borderSizeSlider: NSSlider!
    
    @IBOutlet weak var majorTickWidthSlider: NSSlider!
    @IBOutlet weak var majorTickHeightSlider: NSSlider!
    @IBOutlet weak var majorTickRadiusSlider: NSSlider!
    
    @IBOutlet weak var minorTickWidthSlider: NSSlider!
    @IBOutlet weak var minorTickHeightSlider: NSSlider!
    @IBOutlet weak var minorTickRadiusSlider: NSSlider!
    
    @IBOutlet weak var secondHandWidthSlider: NSSlider!
    @IBOutlet weak var secondHandHeightSlider: NSSlider!
    @IBOutlet weak var secondHandOverhangWidthSlider: NSSlider!
    @IBOutlet weak var secondHandOverhangHeightSlider: NSSlider!
    
    @IBOutlet weak var minuteHandWidthSlider: NSSlider!
    @IBOutlet weak var minuteHandHeightSlider: NSSlider!
    @IBOutlet weak var minuteHandOverhangWidthSlider: NSSlider!
    @IBOutlet weak var minuteHandOverhangHeightSlider: NSSlider!
    
    @IBOutlet weak var hourHandWidthSlider: NSSlider!
    @IBOutlet weak var hourHandHeightSlider: NSSlider!
    @IBOutlet weak var hourHandOverhangWidthSlider: NSSlider!
    @IBOutlet weak var hourHandOverhangHeightSlider: NSSlider!
    
    @IBOutlet weak var skinSelectionButton: NSPopUpButton!
    @IBOutlet weak var lineCapButton: NSPopUpButton!
    
    var liveSkin = LiveSkin()
    
    let itemTitles = [String](arrayLiteral:
                                String(describing: AscotClock.self),
                              String(describing: SwissRailwayClockDark.self),
                              String(describing: SwissRailwayClockLight.self),
                              String(describing: TimeSaverClock.self),
                              String(describing: BraunBN0032Dark.self),
                              String(describing: KundoQuartzRepetitionWestGermanyWecker.self),
                              String(describing: SeikoStandardKX308K.self),
                              String(describing: SeikoStandardKX308KDark.self),
                              String(describing: SeikoStandardKX308W.self),
                              String(describing: SeikoStandardKX308WDark.self),
                              String(describing: FiveOClock.self),
                              String(describing: PunktAC01AlarmClock.self)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Swift.print("MainViewController did load.")
        
        // Setup the clock timer
        let timer = Timer.scheduledTimer(
            timeInterval: clockView.animationTimeInterval,
            target: clockView,
            selector: #selector(SimpleClock.animateOneFrame),
            userInfo: nil,
            repeats: true)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
        
        // Setup the skin selector
        skinSelectionButton.removeAllItems()
        skinSelectionButton.addItems(withTitles: itemTitles)
        
        // Setup the bindings
        clockSizeSlider.bind("value",
                             to: liveSkin.scaling as AnyObject,
                             withKeyPath: "clockFaceHeight",
                             options: nil)
        borderSizeSlider.bind("value",
                              to: liveSkin.scaling as AnyObject,
                              withKeyPath: "borderWidth",
                              options: nil)
        
        majorTickWidthSlider.bind("value",
                                  to: liveSkin.scaling as AnyObject,
                                  withKeyPath: "majorTickWidth",
                                  options: nil)
        majorTickHeightSlider.bind("value",
                                   to: liveSkin.scaling as AnyObject,
                                   withKeyPath: "majorTickHeight",
                                   options: nil)
        majorTickRadiusSlider.bind("value",
                                   to: liveSkin.scaling as AnyObject,
                                   withKeyPath: "majorTickRadius",
                                   options: nil)
        
        minorTickWidthSlider.bind("value",
                                  to: liveSkin.scaling as AnyObject,
                                  withKeyPath: "minorTickWidth",
                                  options: nil)
        minorTickHeightSlider.bind("value",
                                   to: liveSkin.scaling as AnyObject,
                                   withKeyPath: "minorTickHeight",
                                   options: nil)
        minorTickRadiusSlider.bind("value",
                                   to: liveSkin.scaling as AnyObject,
                                   withKeyPath: "minorTickRadius",
                                   options: nil)
        
        secondHandWidthSlider.bind("value",
                                   to: liveSkin.scaling as AnyObject,
                                   withKeyPath: "secondHandWidth",
                                   options: nil)
        secondHandHeightSlider.bind("value",
                                    to: liveSkin.scaling as AnyObject,
                                    withKeyPath: "secondHandHeight",
                                    options: nil)
        secondHandOverhangWidthSlider.bind("value",
                                           to: liveSkin.scaling as AnyObject,
                                           withKeyPath: "secondHandOverhangWidth",
                                           options: nil)
        secondHandOverhangHeightSlider.bind("value",
                                            to: liveSkin.scaling as AnyObject,
                                            withKeyPath: "secondHandOverhangHeight",
                                            options: nil)
        
        minuteHandWidthSlider.bind("value",
                                   to: liveSkin.scaling as AnyObject,
                                   withKeyPath: "minuteHandWidth",
                                   options: nil)
        minuteHandHeightSlider.bind("value",
                                    to: liveSkin.scaling as AnyObject,
                                    withKeyPath: "minuteHandHeight",
                                    options: nil)
        minuteHandOverhangWidthSlider.bind("value",
                                           to: liveSkin.scaling as AnyObject,
                                           withKeyPath: "minuteHandOverhangWidth",
                                           options: nil)
        minuteHandOverhangHeightSlider.bind("value",
                                            to: liveSkin.scaling as AnyObject,
                                            withKeyPath: "minuteHandOverhangHeight",
                                            options: nil)
        
        hourHandWidthSlider.bind("value",
                                 to: liveSkin.scaling as AnyObject,
                                 withKeyPath: "hourHandWidth",
                                 options: nil)
        hourHandHeightSlider.bind("value",
                                  to: liveSkin.scaling as AnyObject,
                                  withKeyPath: "hourHandHeight",
                                  options: nil)
        hourHandOverhangWidthSlider.bind("value",
                                         to: liveSkin.scaling as AnyObject,
                                         withKeyPath: "hourHandOverhangWidth",
                                         options: nil)
        hourHandOverhangHeightSlider.bind("value",
                                          to: liveSkin.scaling as AnyObject,
                                          withKeyPath: "hourHandOverhangHeight",
                                          options: nil)
        
        lineCapButton.bind("selectedIndex",
                           to: liveSkin.lineCap as AnyObject,
                           withKeyPath: "minorTick",
                           options: nil)
        
        clockView.skin = liveSkin
    }
    
    @IBAction func skinSelectionChange(_ sender: NSPopUpButton) {
        Swift.print("Skin change")
        
        var skin: ClockSkin
        
        switch sender.titleOfSelectedItem! {
        case String(describing: AscotClock.self):
            skin = AscotClock()
            
        case String(describing: SwissRailwayClockDark.self):
            skin = SwissRailwayClockDark()
            
        case String(describing: SwissRailwayClockLight.self):
            skin = SwissRailwayClockLight()
            
        case String(describing: TimeSaverClock.self):
            skin = TimeSaverClock()
            
        case String(describing: BraunBN0032Dark.self):
            skin = BraunBN0032Dark()
            
        case String(describing: KundoQuartzRepetitionWestGermanyWecker.self):
            skin = KundoQuartzRepetitionWestGermanyWecker()
            
        case String(describing: SeikoStandardKX308K.self):
            skin = SeikoStandardKX308K()
            
        case String(describing: SeikoStandardKX308KDark.self):
            skin = SeikoStandardKX308KDark()
            
        case String(describing: SeikoStandardKX308W.self):
            skin = SeikoStandardKX308W()
            
        case String(describing: SeikoStandardKX308WDark.self):
            skin = SeikoStandardKX308WDark()
            
        case String(describing: FiveOClock.self):
            skin = FiveOClock()
            
        case String(describing: PunktAC01AlarmClock.self):
            skin = PunktAC01AlarmClock()
            
        default:
            skin = KundoQuartzRepetitionWestGermanyWecker()
        }
        
        clockView.skin = skin
    }
}

class LiveSkin: ClockSkin {
    
    class Scaling: NSObject, ClockSkinScaling {
        
        var clockFaceHeight = CGFloat(0.4)
        var borderWidth =      CGFloat(0.025)
        
        var majorTickWidth =   CGFloat(0.033)
        var majorTickHeight =  CGFloat(0.11)
        
        var minorTickWidth =   CGFloat(0.014)
        var minorTickHeight =  CGFloat(0.0340)
        
        var majorTickRadius =  CGFloat(0.455)
        var minorTickRadius =  CGFloat(0.455)
        
        var secondHandWidth =  CGFloat(0.015)
        var secondHandHeight = CGFloat(0.345)
        var secondHandOverhangWidth = CGFloat(0.015)
        var secondHandOverhangHeight = CGFloat(0.15)
        
        var minuteHandWidth =  CGFloat(0.04)
        var minuteHandHeight = CGFloat(0.44)
        var minuteHandOverhangWidth = CGFloat(0.04)
        var minuteHandOverhangHeight = CGFloat(0.1)
        
        var hourHandWidth =    CGFloat(0.05)
        var hourHandHeight =   CGFloat(0.265)
        var hourHandOverhangWidth = CGFloat(0.05)
        var hourHandOverhangHeight = CGFloat(0.1)
        
        var handCircleRadius = CGFloat(0.0145)
    }
    
    class Color: NSObject, ClockSkinColor {
        var screenBackground = NSColor(red: 0.1486, green: 0.1486, blue: 0.1486, alpha: 1.0).cgColor
        var clockBackground = NSColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        
        var border = NSColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1).cgColor
        var majorTick = NSColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        var minorTick = NSColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        var secondHand = NSColor(red: 0.7322, green: 0.0957, blue: 0.0, alpha: 1.0).cgColor
        var minuteHand = NSColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        var hourHand = NSColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        var handShadow = NSColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
    }
    
    class Tick: NSObject, ClockSkinTick {
        var totalTicks = 60
        var majorTickEveryX = 5
        var removeTickEveryX = 61
    }
    
    class LineCap: NSObject, ClockSkinLineCap {
        var majorTick = CGLineCap.butt
        var minorTick = CGLineCap.butt
        
        var secondHand = CGLineCap.butt
        var secondHandOverhang = CGLineCap.butt
        
        var minuteHand = CGLineCap.butt
        var minuteHandOverhang = CGLineCap.butt
        
        var hourHand = CGLineCap.butt
        var hourHandOverhang = CGLineCap.butt
    }
    
    let scaling: ClockSkinScaling = Scaling()
    let tick: ClockSkinTick = Tick()
    let color: ClockSkinColor = Color()
    let lineCap: ClockSkinLineCap = LineCap()
}
