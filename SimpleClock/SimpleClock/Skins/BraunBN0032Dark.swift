//
//  SwissRailwayClockDark.swift
//  SimpleClock
//
//  Created by Pascal Wagler on 08/07/16.
//  Copyright © 2016 Pascal Wagler. All rights reserved.
//

import Foundation
import ScreenSaver

class BraunBN0032Dark: ClockSkin {

	class Scaling: NSObject, ClockSkinScaling {
		let clockFaceHeight =  CGFloat(0.586)
		let borderWidth =      CGFloat(0.025)

		let majorTickWidth =   CGFloat(0.009)
		let majorTickHeight =  CGFloat(0.045)

		let minorTickWidth =   CGFloat(0.0045)
		let minorTickHeight =  CGFloat(0.045)

		let majorTickRadius =  CGFloat(0.455)
		let minorTickRadius =  CGFloat(0.455)

		let secondHandWidth =  CGFloat(0.009)
		let secondHandHeight = CGFloat(0.37)
		let secondHandOverhangWidth = CGFloat(0.025)
		let secondHandOverhangHeight = CGFloat(0.07)

		let minuteHandWidth =  CGFloat(0.015)
		let minuteHandHeight = CGFloat(0.37)
		let minuteHandOverhangWidth = CGFloat(0.015)
		let minuteHandOverhangHeight = CGFloat(0.01)

		let hourHandWidth =    CGFloat(0.022)
		let hourHandHeight =   CGFloat(0.265)
		let hourHandOverhangWidth = CGFloat(0.022)
		let hourHandOverhangHeight = CGFloat(0.001)

		let handCircleRadius = CGFloat(0.025)
	}

	class Color: NSObject, ClockSkinColor {
		let screenBackground = NSColor(red: 0.13, green: 0.125, blue: 0.1409, alpha: 1.0).cgColor
		let clockBackground = NSColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor

		let border = NSColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0).cgColor
		let majorTick = NSColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
		let minorTick = NSColor(red: 0.5632, green: 0.5598, blue: 0.5705, alpha: 1.0).cgColor

		let secondHand = NSColor(red: 0.9663, green: 0.7711, blue: 0.1798, alpha: 1.0).cgColor
		let minuteHand = NSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
		let hourHand = NSColor(red: 0.7027, green: 0.7027, blue: 0.7027, alpha: 1.0).cgColor
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
		let secondHandOverhang = CGLineCap.round

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
