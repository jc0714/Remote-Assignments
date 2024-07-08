// 4

func printTriangle(layers: Int) { // TODO: print a triangle
    for x in 1..<(layers+1){
        //print((layers-x), 2*x - 1)
        print(String(repeating: " ", count: (layers-x)),String(repeating: "*", count: 2*x-1) )
    }
}
printTriangle(layers: 20)

//5
//: 1. 註冊時可以發送手機驗證碼。
//:2. 如果使用者輸入的手機不是 09 開頭，就在 textfield 下方跳出紅字提示「請確認手機號碼無誤」。
//:3. 在登入頁面有「記得我」的選項可以勾選，這樣下次點開 app 就不用重新輸入一長串帳號密碼。
//:4. 希望網頁版和 app 版本都暢通。（不逼使用者要下載 app）
//:5. 可以每日固定時間發送通知，例如：「每天早上八點傳送一則冷笑話/ 冷知識。」

