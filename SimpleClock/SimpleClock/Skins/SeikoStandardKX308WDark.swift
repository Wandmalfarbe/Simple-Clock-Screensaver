//
//  SwissRailwayClockDark.swift
//  SimpleClock
//
//  Created by Pascal Wagler on 31/07/16.
//  Copyright (c) 2016 - 2018 Pascal Wagler. All rights reserved.
//

import Foundation
import ScreenSaver

class SeikoStandardKX308WDark: ClockSkin {

	class Scaling: NSObject, ClockSkinScaling {
		let clockFaceHeight =  CGFloat(0.57)
		let borderWidth =      CGFloat(0.022)

		let majorTickWidth =   CGFloat(0.016)
		let majorTickHeight =  CGFloat(0.104)

		let minorTickWidth =   CGFloat(0.004)
		let minorTickHeight =  CGFloat(0.029)

		let majorTickRadius =  CGFloat(0.440)
		let minorTickRadius =  CGFloat(0.440)

		let secondHandWidth =  CGFloat(0.005)
		let secondHandHeight = CGFloat(0.390)
		let secondHandOverhangWidth = CGFloat(0.005)
		let secondHandOverhangHeight = CGFloat(0.0001)

		let minuteHandWidth =  CGFloat(0.014)
		let minuteHandHeight = CGFloat(0.410)
		let minuteHandOverhangWidth = CGFloat(0.014)
		let minuteHandOverhangHeight = CGFloat(0.07)

		let hourHandWidth =    CGFloat(0.024)
		let hourHandHeight =   CGFloat(0.265)
		let hourHandOverhangWidth = CGFloat(0.024)
		let hourHandOverhangHeight = CGFloat(0.07)

		let handCircleRadius = CGFloat(0.027)
	}

	class Color: NSObject, ClockSkinColor {
		let screenBackground = NSColor(srgbRed: 0.0628, green: 0.1178, blue: 0.1187, alpha: 1.0).cgColor
		let clockBackground = NSColor(srgbRed: 0.0628, green: 0.1178, blue: 0.1187, alpha: 0).cgColor

		let border = NSColor(srgbRed: 1, green: 1, blue: 1, alpha: 0).cgColor
		let majorTick = NSColor(srgbRed: 1, green: 1, blue: 1, alpha: 1.0).cgColor
		let minorTick = NSColor(srgbRed: 1, green: 1, blue: 1, alpha: 1.0).cgColor

		let secondHand = NSColor(srgbRed: 1, green: 1, blue: 1, alpha: 1.0).cgColor
		let minuteHand = NSColor(srgbRed: 1, green: 1, blue: 1, alpha: 1.0).cgColor
		let hourHand = NSColor(srgbRed: 1, green: 1, blue: 1, alpha: 1.0).cgColor
		let handShadow = NSColor(srgbRed: 1, green: 1, blue: 1, alpha: 1.0).cgColor
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
