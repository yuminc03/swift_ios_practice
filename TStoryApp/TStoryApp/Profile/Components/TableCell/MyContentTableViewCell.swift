//
//  MyContentTableViewCell.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/26.
//

import UIKit

class MyContentTableViewCell: UITableViewCell {
     
    
    lazy var myContentTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "여기는 게시물의 제목입니다."
        label.textColor = .black
        label.lineBreakMode = .byTruncatingTail
        label.font = .systemFont(ofSize: 17)
        self.addSubview(label)
        return label
    }()

    lazy var myContentImageView: UIView = {//게시물 사진
        let image = UIView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        self.addSubview(image)
        return image
    }()

    lazy var myContentLikeView: UIView = {//하트 아이콘
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink.withAlphaComponent(0.6)
        view.layer.cornerRadius = 5
        self.addSubview(view)
        return view
    }()

    lazy var myContentLikeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "1"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        self.addSubview(label)
        return label
    }()

    lazy var myContentCommentView: UIView = {//댓글 아이콘
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue.withAlphaComponent(0.8)
        view.layer.cornerRadius = 2
        self.addSubview(view)
        return view
    }()

    lazy var myContentCommentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "2"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        self.addSubview(label)
        return label
    }()

    lazy var myContentDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "2021.10.14."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        self.addSubview(label)
        return label
    }()
    
    lazy var cellDividedLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        addSubview(view)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setBackgroundColor(index: Int) {
        myContentImageView.backgroundColor = .systemBlue.withAlphaComponent(CGFloat(index + 1) * 0.1)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            myContentTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myContentTitleLabel.trailingAnchor.constraint(equalTo: myContentImageView.leadingAnchor, constant: -20),
            myContentTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            myContentTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])

        NSLayoutConstraint.activate([
            myContentImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            myContentImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            myContentImageView.heightAnchor.constraint(equalToConstant: 50),
            myContentImageView.widthAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            myContentLikeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myContentLikeView.widthAnchor.constraint(equalToConstant: 10),
            myContentLikeView.heightAnchor.constraint(equalToConstant: 10),
            myContentLikeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            myContentLikeLabel.leadingAnchor.constraint(equalTo: myContentLikeView.trailingAnchor, constant: 5),
            myContentLikeLabel.centerYAnchor.constraint(equalTo: myContentLikeView.centerYAnchor),
            myContentLikeLabel.topAnchor.constraint(equalTo: myContentTitleLabel.bottomAnchor, constant: 5),
        ])

        NSLayoutConstraint.activate([
            myContentCommentView.leadingAnchor.constraint(equalTo: myContentLikeLabel.trailingAnchor, constant: 15),
            myContentCommentView.widthAnchor.constraint(equalToConstant: 10),
            myContentCommentView.heightAnchor.constraint(equalToConstant: 10),
            myContentCommentView.centerYAnchor.constraint(equalTo: myContentLikeView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            myContentCommentLabel.leadingAnchor.constraint(equalTo: myContentCommentView.trailingAnchor, constant: 5),
            myContentCommentLabel.topAnchor.constraint(equalTo: myContentTitleLabel.bottomAnchor, constant: 5),
            myContentCommentLabel.centerYAnchor.constraint(equalTo: myContentLikeView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            myContentDateLabel.leadingAnchor.constraint(equalTo: myContentCommentLabel.trailingAnchor, constant: 15),
            myContentDateLabel.topAnchor.constraint(equalTo: myContentTitleLabel.bottomAnchor, constant: 5),
            myContentDateLabel.centerYAnchor.constraint(equalTo: myContentLikeView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cellDividedLine.heightAnchor.constraint(equalToConstant: 0.5),
            cellDividedLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellDividedLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellDividedLine.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    func setTableViewCellData(title: String, likeNum: Int, commentNum: Int, date: String) {
        myContentTitleLabel.text = title
        myContentLikeLabel.text = String(likeNum)
        myContentCommentLabel.text = String(commentNum)
        myContentDateLabel.text = date
    }
    
}
