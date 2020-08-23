//
//  CurrentLineView.swift
//  KVKCalendar
//
//  Created by Sergei Kviatkovskii on 22.08.2020.
//

import UIKit

final class CurrentLineView: UIView {
    
    private let style: Style
    private let timeHourSystem: TimeHourSystem

    private lazy var timeLabel: TimelineLabel = {
        let label = TimelineLabel()
        label.textColor = style.timeline.currentLineHourColor
        label.textAlignment = .center
        label.font = style.timeline.currentLineHourFont
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        
        let formatter = DateFormatter()
        formatter.dateFormat = timeHourSystem.format
        label.text = formatter.string(from: Date())
        label.valueHash = Date().minute.hashValue
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = style.timeline.currentLineHourColor
        return view
    }()
    
    private lazy var dotView: UIView = {
        let view = UIView()
        view.backgroundColor = style.timeline.currentLineHourColor
        return view
    }()
    
    var valueHash: Int?
    
    var time: String? {
        didSet {
            timeLabel.text = time
        }
    }
    
    init(style: Style, frame: CGRect, timeHourSystem: TimeHourSystem) {
        self.style = style
        self.timeHourSystem = timeHourSystem
        super.init(frame: frame)
        
        timeLabel.frame = CGRect(x: 0, y: 0, width: style.timeline.currentLineHourWidth, height: frame.height)
        dotView.frame = CGRect(x: style.timeline.currentLineHourWidth - 2, y: (frame.height * 0.5) - 2, width: 5, height: 5)
        lineView.frame = CGRect(x: style.timeline.currentLineHourWidth, y: frame.height * 0.5, width: frame.width - style.timeline.currentLineHourWidth, height: style.timeline.currentLineHourHeight)
        [timeLabel, lineView, dotView].forEach({ addSubview($0) })
        dotView.setRoundCorners(radius: CGSize(width: 2.5, height: 2.5))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
