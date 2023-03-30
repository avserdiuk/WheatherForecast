//
//  CustomTable24hViewCell.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 23.03.2023.
//

import UIKit

class CustomTable24hViewCell: UITableViewCell {

    var hour : [Int] = [0,3,6,9,12,15,18,21]

    private lazy var wrapperView = CVView()

    private lazy var mainStackView = CVStackView(axis: .vertical, spacing: 8)
    private lazy var dateLabel = CVLabel(text: "пт 16/04", size: 18, weight: .semibold)
    private lazy var timeLabel = CVLabel(text: "12:00", size: 14, weight: .regular, color: .textGray)
    private lazy var degreeLabel = CVLabel(text: "13°", size: 18, weight: .semibold)

    private lazy var add1StackView = CVStackView(axis: .vertical, spacing: 15)
    private lazy var moonImageView = CVImage(imageName: "forecast24_moon")
    private lazy var windImageView = CVImage(imageName: "forecast24_wind")
    private lazy var rainImageView = CVImage(imageName: "forecast24_rain")
    private lazy var cloudImageView = CVImage(imageName: "forecast24_cloud")

    private lazy var add2StackView = CVStackView(axis: .vertical, spacing: 9)
    private lazy var add1Label = CVLabel(text: forecast24Add1Label, size: 14, weight: .regular)
    private lazy var add2Label = CVLabel(text: forecast24Add2Label, size: 14, weight: .regular)
    private lazy var add3Label = CVLabel(text: forecast24Add3Label, size: 14, weight: .regular)
    private lazy var add4Label = CVLabel(text: forecast24Add4Label, size: 14, weight: .regular)

    private lazy var add3StackView = CVStackView(axis: .vertical, spacing: 9, alignment: .trailing)
    private lazy var add11Label = CVLabel(text: " ", size: 14, weight: .regular, color: .textGray)
    private lazy var add22Label = CVLabel(text: "2 м/с ССЗ", size: 14, weight: .regular, color: .textGray)
    private lazy var add33Label = CVLabel(text: "0%", size: 14, weight: .regular, color: .textGray)
    private lazy var add44Label = CVLabel(text: "29%", size: 14, weight: .regular, color: .textGray)

    private lazy var hrView = CVView(backgroundColor: .accentBlue)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Colors.backgroundWhite.color

        setViews()
        setConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(_ wheather : Wheather, _ indexPath: IndexPath){

        dateLabel.text = getTime(unixtime: wheather.forecasts[0].unixtime)
        timeLabel.text = "\(hour[indexPath.item]):00"
        degreeLabel.text = "\(wheather.forecasts[0].hours[hour[indexPath.item]].temp)"
        add1Label.text = "\(getCondition(wheather.forecasts[0].hours[hour[indexPath.item]].condition)), по ощущению \(wheather.forecasts[0].hours[hour[indexPath.item]].feelsLike)"
        add22Label.text = "\(wheather.forecasts[0].hours[hour[indexPath.item]].windSpeed) м/с \(getWindDir(wheather.forecasts[0].hours[hour[indexPath.item]].windDir))"
        add33Label.text = "\(Int(wheather.forecasts[0].hours[hour[indexPath.item]].precipitation*100))%"
        add44Label.text = "\(Int(wheather.forecasts[0].hours[hour[indexPath.item]].cloudness*100))%"

    }

    func getIndixesMass(){

        let currentHour = getCurrentHour()

            switch currentHour {
            case 0...2:
                hour = [0,3,6,9,12,15,18,21]
            case 3...5:
                hour = [3,6,9,12,15,18,21,0]
            case 6...8:
                hour = [6,9,12,15,18,21,0,3]
            case 9...11:
                hour = [9,12,15,18,21,0,3,6]
            case 12...14:
                hour = [12,15,18,21,0,3,6,9]
            case 15...17:
                hour = [15,18,21,0,3,6,9,12]
            case 18...20:
                hour = [18,21,0,3,6,9,12,15]
            case 21...23:
                hour = [21,0,3,6,9,12,15,18]
            default:
                return
            }

    }

    func getCurrentHour() -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let dateInFormat = dateFormatter.string(from: NSDate() as Date)
        return Int(dateInFormat)!
    }

    func getTime(unixtime : Int) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(unixtime))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E dd/MM "
        let dateInFormat = dateFormatter.string(from: date as Date)
        return dateInFormat
    }

    func setViews(){
        addSubview(wrapperView)
        wrapperView.addSubview(mainStackView)
            mainStackView.addArrangedSubview(dateLabel)
            mainStackView.addArrangedSubview(timeLabel)
            mainStackView.addArrangedSubview(degreeLabel)
        wrapperView.addSubview(add1StackView)
            add1StackView.addArrangedSubview(moonImageView)
            add1StackView.addArrangedSubview(windImageView)
            add1StackView.addArrangedSubview(rainImageView)
            add1StackView.addArrangedSubview(cloudImageView)
        wrapperView.addSubview(add2StackView)
            add2StackView.addArrangedSubview(add1Label)
            add2StackView.addArrangedSubview(add2Label)
            add2StackView.addArrangedSubview(add3Label)
            add2StackView.addArrangedSubview(add4Label)
        wrapperView.addSubview(add3StackView)
            add3StackView.addArrangedSubview(add11Label)
            add3StackView.addArrangedSubview(add22Label)
            add3StackView.addArrangedSubview(add33Label)
            add3StackView.addArrangedSubview(add44Label)
        wrapperView.addSubview(hrView)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([

            wrapperView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            wrapperView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            wrapperView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            wrapperView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

            mainStackView.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 0),
            mainStackView.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 0),
            mainStackView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -64),

            dateLabel.heightAnchor.constraint(equalToConstant: 22),
            timeLabel.heightAnchor.constraint(equalToConstant: 19),

            add1StackView.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 33),
            add1StackView.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 88),

            add2StackView.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 33),
            add2StackView.leftAnchor.constraint(equalTo: add1StackView.rightAnchor, constant: 10),

            add3StackView.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 33),
            add3StackView.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: 0),

            hrView.heightAnchor.constraint(equalToConstant: 0.7),
            hrView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: 0),
            hrView.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 0),
            hrView.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: 0),

        ])
    }
}
