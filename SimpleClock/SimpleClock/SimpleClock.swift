import Foundation
import ScreenSaver

class SimpleClock: ScreenSaverView {

	var context: CGContext! = nil
	var skin: ClockSkin! = nil
	var clockRect: NSRect! = nil

	func getSize(_ scalingFactor: CGFloat) -> CGFloat {
		return clockRect.size.height * scalingFactor
	}

	override func draw(_ screenRect: NSRect) {
		super.draw(screenRect)

		context = NSGraphicsContext.current()!.cgContext

		skin = SwissRailwayClockDark()
		//skin = SwissRailwayClockLight()
		//skin = TimeSaverClock()
		//skin = AscotClock()
		//skin = BraunBN0032Dark()
		//skin = KundoQuartzRepetitionWestGermanyWecker()

		//skin = SeikoStandardKX308K()
		//skin = SeikoStandardKX308KDark()

		//skin = SeikoStandardKX308W()
		//skin = SeikoStandardKX308WDark()

		//skin = FiveOClock()

		if skin == nil {
			//Swift.print("Is nil")
			skin = BraunBN0032Dark()
			//return
		}

		clockRect = getClockRect(screenRect)

		/*
		 * Draw the screen background (color)
		 */
		context.saveGState()
		context.setFillColor(skin.color.screenBackground)
		context.fill(self.bounds)
		context.restoreGState()

		/*
		 * Get the time
		 */

		let date: Date = Date()
		let seconds: CGFloat = date.secondsAgo()
		let minutes: CGFloat = date.minutesAgo()
		let hours: CGFloat = date.hoursAgo()

		/*
		 * Draw the clock
		 */

		drawClockFace()

		drawClockTicks(
			skin.tick.totalTicks,
			majorTickEveryX: skin.tick.majorTickEveryX,
			removeTickEveryX: skin.tick.removeTickEveryX
		)

		drawClockHand( // Hour
			CGSize(width: getSize(skin.scaling.hourHandWidth),	height: getSize(skin.scaling.hourHandHeight)),
			overhangSize: CGSize(width: getSize(skin.scaling.hourHandOverhangWidth), height: getSize(skin.scaling.hourHandOverhangHeight)),
			color: skin.color.hourHand,
			lineCap: (skin.lineCap.hourHand, skin.lineCap.hourHandOverhang),
			progress: hours * 12,
			total: 12
		)

		drawClockHand( // Minute
			CGSize(width: getSize(skin.scaling.minuteHandWidth), height: getSize(skin.scaling.minuteHandHeight)),
			overhangSize: CGSize(width: getSize(skin.scaling.minuteHandOverhangWidth), height: getSize(skin.scaling.minuteHandOverhangHeight)),
			color: skin.color.minuteHand,
			lineCap: (skin.lineCap.minuteHand, skin.lineCap.minuteHandOverhang),
			progress: minutes * 60,
			total: 60
		)

		drawClockHand( // Second
			CGSize(width: getSize(skin.scaling.secondHandWidth), height: getSize(skin.scaling.secondHandHeight)),
			overhangSize: CGSize(width: getSize(skin.scaling.secondHandOverhangWidth), height: getSize(skin.scaling.secondHandOverhangHeight)),
			color: skin.color.secondHand,
			lineCap: (skin.lineCap.secondHand, skin.lineCap.secondHandOverhang),
			progress: seconds * 60,
			total: 60
		)

		drawHandCircle()
	}

	func drawClockFace() {

		context.saveGState()

		context.setLineWidth(ceil(getSize(skin.scaling.borderWidth)))
		context.setStrokeColor(skin.color.border)
		context.setFillColor(skin.color.clockBackground)

		context.addEllipse(in: clockRect)
		context.drawPath(using: .fillStroke)
		context.strokePath()

		context.restoreGState()
	}

	func drawClockTicks(_ totalTicks: Int, majorTickEveryX: Int, removeTickEveryX: Int) {

		context.saveGState()

		let center: CGPoint = CGPoint(x: clockRect.midX, y: clockRect.midY)

		let majorTickWidth   = getSize(skin.scaling.majorTickWidth)
		let majorTickHeight  = getSize(skin.scaling.majorTickHeight)
		let majorTickColor   = skin.color.majorTick
		let majorTickRadius  = getSize(skin.scaling.majorTickRadius)
		let majorTickLineCap = skin.lineCap.majorTick

		let minorTickWidth   = getSize(skin.scaling.minorTickWidth)
		let minorTickHeight  = getSize(skin.scaling.minorTickHeight)
		let minorTickColor   = skin.color.minorTick
		let minorTickRadius  = getSize(skin.scaling.minorTickRadius)
		let minorTickLineCap = skin.lineCap.minorTick

		var tickHeight: CGFloat
		var tickRadius: CGFloat

		var time: Int = totalTicks
		while time > 0 {

			let angle: CGFloat = self.angleForTimeUnit(CGFloat(time), total: totalTicks)
			let isMajorTick = (time % majorTickEveryX == 0)
			let isHiddenTick = (time % removeTickEveryX == 0)

			if isMajorTick {
				context.setLineWidth(ceil(majorTickWidth))
				context.setStrokeColor(majorTickColor)
				context.setLineCap(majorTickLineCap)
				tickHeight = majorTickHeight
				tickRadius = majorTickRadius
			} else {
				context.setLineWidth(ceil(minorTickWidth))
				context.setStrokeColor(minorTickColor)
				context.setLineCap(minorTickLineCap)
				tickHeight = minorTickHeight
				tickRadius = minorTickRadius
			}

			if !isHiddenTick {
				let x: CGFloat = center.x + (cos(angle) * tickRadius)
				let y: CGFloat = center.y + (sin(angle) * tickRadius)

				let x2: CGFloat = center.x + (cos(angle) * (tickRadius - tickHeight))
				let y2: CGFloat = center.y + (sin(angle) * (tickRadius - tickHeight))

				context.beginPath()
				context.move(to: CGPoint(x: ceil(x), y: ceil(y)))
				context.addLine(to: CGPoint(x: ceil(x2), y: ceil(y2)))
				context.strokePath()
			}

			time -= 1
		}
		context.restoreGState()
	}

	func drawClockHand(_ size: CGSize, overhangSize: CGSize, color: CGColor, lineCap: (CGLineCap, CGLineCap), progress: CGFloat, total: Int) {
		let center: CGPoint = CGPoint(x: clockRect.midX, y: clockRect.midY)

		let angle: CGFloat = self.angleForTimeUnit(progress, total: total)
		let x: CGFloat = center.x + (cos(angle) * size.height)
		let y: CGFloat = center.y + (sin(angle) * size.height)

		let x2: CGFloat = center.x + (-cos(angle) * overhangSize.height)
		let y2: CGFloat = center.y + (-sin(angle) * overhangSize.height)

		context.saveGState()

		//CGContextSetShadowWithColor(context, CGSize(width: 0, height: 0), 1, skin.color.handShadow)
		context.setStrokeColor(color)

		context.beginPath()
		context.setLineCap(lineCap.0)
		context.setLineWidth(ceil(size.width))
		context.move(to: CGPoint(x: x, y: y))
		context.addLine(to: CGPoint(x: center.x, y: center.y))
		context.strokePath()

		context.beginPath()
		context.setLineCap(lineCap.1)
		context.setLineWidth(ceil(overhangSize.width))
		context.move(to: CGPoint(x: center.x, y: center.y))
		context.addLine(to: CGPoint(x: x2, y: y2))
		context.strokePath()

		context.restoreGState()
	}

	func drawHandCircle() {

		let size = CGSize(
			width: getSize(skin.scaling.handCircleRadius) * 2,
			height: getSize(skin.scaling.handCircleRadius) * 2
		)

		let rect = newRectCenteredInRect(size, outerRect: clockRect)

		context.saveGState()

		context.setFillColor(skin.color.secondHand)
		context.addEllipse(in: rect)
		(context).fillPath()

		context.restoreGState()
	}

	func getClockRect(_ screenRect: CGRect) -> CGRect {

		let maxClockHeight = min(screenRect.size.width, screenRect.size.height)
		let clockHeight = maxClockHeight * skin.scaling.clockFaceHeight

		let size = CGSize(width: clockHeight, height: clockHeight)
		let clockRect = newRectCenteredInRect(size, outerRect: screenRect)

		return clockRect
	}

	func angleForTimeUnit(_ time: CGFloat, total: Int) -> CGFloat {
		let degreesPerTime = 360 / CGFloat(total)
		let radians = (degreesPerTime * CGFloat(M_PI)) / 180
		let angle = -(radians * CGFloat(time) - CGFloat(M_PI_2))

		return CGFloat(angle)
	}

	/*
	 * from ScreenSaverView
	 */

	override init(frame: NSRect, isPreview: Bool) {
		super.init(frame: frame, isPreview: isPreview)!

		self.animationTimeInterval = TimeInterval(1)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override func startAnimation() {
		super.startAnimation()
	}

	override func stopAnimation() {
		super.stopAnimation()
	}

	override func animateOneFrame() {
		needsDisplay = true
	}

	override func hasConfigureSheet() -> Bool {
		return false
	}

	override func configureSheet() -> NSWindow? {
		return nil
	}
}

func newRectCenteredInRect(_ size: CGSize, outerRect: NSRect) -> CGRect {

	var innerRect = NSRect()
	innerRect.size.width = size.width
	innerRect.size.height = size.height

	innerRect.origin.x =
		floor(outerRect.origin.x + (outerRect.size.width - innerRect.size.width) / 2)

	innerRect.origin.y =
		floor(outerRect.origin.y + (outerRect.size.height - innerRect.size.height) / 2)

	return innerRect
}
