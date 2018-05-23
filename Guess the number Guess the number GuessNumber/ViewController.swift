//
//  ViewController.swift
//  Guess the number Guess the number GuessNumber
//
//  Created by winni on 2018/5/23.
//  Copyright © 2018年 winni. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var keyinNumber: UITextField!
    @IBOutlet weak var mixNumber: UILabel!
    @IBOutlet weak var maxNumber: UILabel!
    @IBOutlet weak var countMessage: UILabel!
    @IBOutlet weak var anserMassage: UILabel!
    
    var ansNumber: Int = 0 //answer
    var chance = 6 //機會次數
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ansNumber = Int(arc4random_uniform(98)) + 2 //隨機出現數字2~99
        mixNumber.text = String(1)
        maxNumber.text = String(100)
        chance = 6
        keyinNumber.text = nil
        anserMassage.text = "還剩\(chance)次機會"
        countMessage.text = "請於以下範圍內，猜一個數字"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func running(){
        if let input = Int(keyinNumber.text!){
            if chance > 0{
                if input >= Int(mixNumber.text!)! && input <= Int(maxNumber.text!)!{
                    chance -= 1
                    if input == ansNumber{
                        countMessage.text = "完全正確～不用放水！"
                    }else{
                        if chance == 0{
                            countMessage.text = "錯！去放水！其實答案是\(ansNumber)😜"
                        }else{
                            if input > ansNumber{
                                maxNumber.text = "\(input)"
                                countMessage.text = "\(input) 太大囉！"
                            }else if input < ansNumber{
                                mixNumber.text = "\(input)"
                                countMessage.text = "\(input) 太小了！"
                            }
                            keyinNumber.text = nil}
                    }
                }else{
                    countMessage.text = "請輸入範圍內的數字！"
                }
            }else{
                countMessage.text = "錯！！去放水！其實答案是\(ansNumber)"
            }
            anserMassage.text = "還剩\(chance)次機會"
        }
    }
    
    
    
    
    
    
    
    @IBAction func okButton(_ sender: Any) {
        running()
    }
    @IBAction func newGame(_ sender: Any) {
        viewDidLoad()
    }
    
}

