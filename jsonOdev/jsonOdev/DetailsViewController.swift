//
//  DetailsViewController.swift
//  jsonOdev
//
//  Created by kerem on 14.04.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
  
    var image = UIImage()
    
    var name = ""
    
    var descriptionText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        

               
                let scrollView = UIScrollView(frame: view.bounds)
            
                
                let contentView = UIView()
                contentView.translatesAutoresizingMaskIntoConstraints = false
                scrollView.addSubview(contentView)

               
                let nameLabel = UILabel()
                nameLabel.translatesAutoresizingMaskIntoConstraints = false
                nameLabel.numberOfLines = 0
                nameLabel.text = name
                contentView.addSubview(nameLabel)

               
                let imageView = UIImageView()
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.contentMode = .scaleAspectFit
                imageView.image = image
                contentView.addSubview(imageView)

               
                let contentLabel = UILabel()
                contentLabel.translatesAutoresizingMaskIntoConstraints = false
                contentLabel.numberOfLines = 0
                contentLabel.text = descriptionText
                contentView.addSubview(contentLabel)

               
                NSLayoutConstraint.activate([
                    contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

                    nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
                    nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

                    imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                    imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                    imageView.widthAnchor.constraint(equalToConstant: 200),
                    imageView.heightAnchor.constraint(equalToConstant: 450),

                    contentLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                    contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                    contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                    contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                    contentLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40)
                ])

//               bu yoruma aldığım kodlar eğer içerik uzunluğu yeterli değilse yeterli seviyeye getirerek scroll un çalışmasını sağlıyor. ama ben kodumu zaten scroll un çalışabileceği şekle getirdiğim için kullanmadım.
//                contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor).isActive = true
//                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

                view.addSubview(scrollView)
            }
        }

        
        
        
        
        
        
    

