//
//  ViewController.swift
//  SomeLighrs
//
//  Created by Марина Щербикова on 09.11.2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    /// Не показываем плашку сверху с датой и зярядкой
    override var prefersStatusBarHidden: Bool{
         true //для метода с 1 строчкой можно убрать return
    }
    
    /// Признак того, что фонарик включен
    var isOn = false //is нужно начинать для булева типа

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /// Реагируем на нажатие кнопки
    @IBAction func buttonPressed() {
        changeValue()
//        changeBackground()
        interactWithLight()
        
    }
    
    
    /// Меняем значение флага
    fileprivate func changeValue() {
        //        print("Button was pressed")
        
        //        if isOn {
        //            idOn == false
        //        } else {
        //            isOn = true
        //        }
        
        //        isOn = isOn ? false : true
        //        isOn.toggle()
        
        isOn = !isOn
    }
    
    
    /// Взаимодействие со вспышкой на реальном девайся
    func interactWithLight(){
        
        /// Взаимодействие с реальным девайсом
        if let device = AVCaptureDevice.default(for: .video), device.hasTorch{
            
            /// Ловим ошибку
            do{
                ///резеврируем вспышку для использования
                try device.lockForConfiguration()
                device.torchMode = isOn ? .on : .off
                device.unlockForConfiguration()
            } catch {
                ///Печатаем ошибку
                print(error.localizedDescription)
            }
            
        }
        
        else{
            changeValue()
        }
    }
    
    /// Меняем наш фон экрана в зависимости от признака 'isOn'
    fileprivate func changeBackground() {
        view.backgroundColor = isOn ? .white : .black
    }
    
}

