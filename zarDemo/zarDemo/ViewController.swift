//
//  ViewController.swift
//  zarDemo
//
//  Created by Hasan Ali on 24.03.2020.
//  Copyright © 2020 Hasan Ali Şişeci. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView1.image = UIImage(named: "dice")
        imageView2.image = UIImage(named: "dice")
        

    }
    
    func randomSayi() {
        //Birinci yöntemimiz için bir sayı dizisi oluşturuyoruz ve içine zar numaralarını giriyoruz.
        let sayilar = [0,1,2,3,4,5,6]
        //.randomElement() komutu ile dizimizden rastgele bir sayı seçip sayi1 değişkenine aktarıyoruz.//Ayrıca burada dizinin tipi olmadığı için
        //gelen değişkeni "!" kullanarak kesin integer değer olduğunu belirtiyoruz.
        var sayi1 : Int = sayilar.randomElement()!
        
        //İkinci Yöntem ise "arc4random_uniform" fonksiyonu
        //Bu fonksiyon ile 0'dan fonksiyonun içine gönderilen değer arasından bir değer seçilir. Biz sıfır gelmemesini istediğimiz için
        // +1 ile bu durumun önüne geçiyoruz.
        var sayi2 = arc4random_uniform(UInt32(6))+1
        
        //Görselleri seçmek
        imageView1.image = UIImage(named: "dice\(sayi1)")
        imageView2.image = UIImage(named: "dice\(sayi2)")
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
        randomSayi()
    }


}

