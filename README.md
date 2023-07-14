# guessNumber

製作一個終極密碼的小遊戲app
利用元件：UILabel、UITextField、UIButton

![Simulator Screen Recording - iPhone 14 Pro - 2023-07-14 at 17 30 53](https://github.com/peanutZLS/guessNumber/assets/139115922/0ec83c1a-b317-487b-8ca1-94c22548471b)


    @IBOutlet weak var guessNumber: UITextField!       // 用於輸入猜測數字的文字輸入框
    @IBOutlet weak var textLabel: UILabel!             // 用於顯示猜測結果的標籤
    var max = 100                                      // 最大範圍
    var min = 1                                        // 最小範圍
    var guessNum = Int.random(in: 2...99)              // 隨機生成的待猜數字

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
                                                        // 處理開始新遊戲的按鈕點擊事件
    @IBAction func newgame(_ sender: Any) {
        max = 100                                      // 重置最大範圍為100
        min = 1                                        // 重置最小範圍為1
        var guessNum = Int.random(in: 2...99)          // 重新生成待猜數字
        guessNumber.text = ""                          // 清空文字輸入框
        textLabel.text = "請輸入 1 ~ 100"               // 顯示提示訊息
        guessNumber.placeholder = ""                   // 清空輸入框的佔位符
        
    }
    
    // 處理顯示提示的按鈕點擊事件
    @IBAction func hint(_ sender: Any) {
        guessNumber.placeholder = "\(guessNum)"        // 將待猜數字顯示在輸入框的佔位符中
    }
    
    // 處理猜測按鈕的點擊事件
    @IBAction func guess(_ sender: Any) {
        var guessText = guessNumber.text!              // 獲取使用者輸入的猜測數字文字
        var GuessNumber = Int(guessText)               // 將使用者輸入的文字轉換為整數型態
        
        if GuessNumber == nil { // 如果轉換失敗，說明使用者輸入的不是有效的數字
            textLabel.text = "請輸入 \(min) ~ \(max)"   // 顯示提示訊息，要求使用者輸入正確的範圍
        } else if GuessNumber! > max { // 如果使用者輸入的數字大於最大範圍
            textLabel.text = "太高了！請輸入 1 ~ 100"    // 顯示提示訊息，告訴使用者輸入的數字過大
        } else if GuessNumber! < min { // 如果使用者輸入的數字小於最小範圍
            textLabel.text = "太低了！請輸入 1 ~ 100"    // 顯示提示訊息，告訴使用者輸入的數字過小
        } else if GuessNumber! >= min && GuessNumber! < guessNum { // 如果使用者輸入的數字在最小範圍和待猜數字之間
            min = GuessNumber! // 更新最小範圍
            textLabel.text = "請輸入 \(min) ~ \(max)"  // 顯示提示訊息，告訴使用者繼續輸入更大的數字
        } else if GuessNumber! <= max && GuessNumber! > guessNum { // 如果使用者輸入的數字在待猜數字和最大範圍之間
            max = GuessNumber! // 更新最大範圍
            textLabel.text = "請輸入 \(min) ~ \(max)"  // 顯示提示訊息，告訴使用者繼續輸入更小的數字
        } else { // 使用者猜測正確
            textLabel.text = "恭喜！"                  // 顯示恭喜訊息
        }
