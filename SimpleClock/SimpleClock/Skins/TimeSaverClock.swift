//
//  TimeSaverClockDark.swift
//  SimpleClock
//
//  Created by Pascal Wagler on 08/07/16.
//  Copyright © 2016 Pascal Wagler. All rights reserved.
//

import Foundation
import ScreenSaver

class TimeSaverClock: ClockSkin {

	class Scaling: NSObject, ClockSkinScaling {
		let clockFaceHeight =  CGFloat(0.8)
		let borderWidth =      CGFloat(0.03)

		let majorTickWidth =   CGFloat(0.018)
		let majorTickHeight =  CGFloat(0.04)

		let minorTickWidth =   CGFloat(0.006)
		let minorTickHeight =  CGFloat(0.012)

		let majorTickRadius =  CGFloat(0.455)
		let minorTickRadius =  CGFloat(0.455)

		let secondHandWidth =  CGFloat(0.012)
		let secondHandHeight = CGFloat(0.455)
		let secondHandOverhangWidth = CGFloat(0.012)
		let secondHandOverhangHeight = CGFloat(0.1)

		let minuteHandWidth =  CGFloat(0.032)
		let minuteHandHeight = CGFloat(0.455)
		let minuteHandOverhangWidth = CGFloat(0.032)
		let minuteHandOverhangHeight = CGFloat(0.1)

		let hourHandWidth =    CGFloat(0.04)
		let hourHandHeight =   CGFloat(0.3)
		let hourHandOverhangWidth = CGFloat(0.04)
		let hourHandOverhangHeight = CGFloat(0.1)

		let handCircleRadius = CGFloat(0.032)
	}

	class Color: NSObject, ClockSkinColor {
		let screenBackground = NSColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1).cgColor
		let clockBackground = NSColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

		let border = NSColor(red: 1, green: 1, blue: 1, alpha: 0.6).cgColor
		let majorTick = NSColor(red: 1, green: 1, blue: 1, alpha: 0.4).cgColor
		let minorTick = NSColor(red: 1, green: 1, blue: 1, alpha: 0.4).cgColor

		let secondHand = NSColor(red: 1, green: 1, blue: 1, alpha: 1.0).cgColor
		let minuteHand = NSColor(red: 1, green: 1, blue: 1, alpha: 1.0).cgColor
		let hourHand = NSColor(red: 1, green: 1, blue: 1, alpha: 1.0).cgColor
		let handShadow = NSColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
	}

	class Tick: NSObject, ClockSkinTick {
		let totalTicks = 60
		let majorTickEveryX = 5
		let removeTickEveryX = 61
	}

	class LineCap: NSObject, ClockSkinLineCap {
		let majorTick = CGLineCap.butt
		let minorTick = CGLineCap.butt

		let secondHand = CGLineCap.butt
		let secondHandOverhang = CGLineCap.butt

		let minuteHand = CGLineCap.butt
		let minuteHandOverhang = CGLineCap.butt

		let hourHand = CGLineCap.butt
		let hourHandOverhang = CGLineCap.butt
	}

	let scaling: ClockSkinScaling = Scaling()
	let tick: ClockSkinTick = Tick()
	let color: ClockSkinColor = Color()
	let lineCap: ClockSkinLineCap = LineCap()
}
