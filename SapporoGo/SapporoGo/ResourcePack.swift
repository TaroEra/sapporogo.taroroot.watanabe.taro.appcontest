//
//  ResourcePack.swift
//  SapporoGo
//
//  Created by Taro Era on 2016/09/15.
//  Copyright © 2016年 com.era.watanabe.sapporo.go. All rights reserved.
//

import Foundation

class ResourcePack: Pack {
    
    init(){
        super.init(name: "ごみ・資源", contents:[
            
            ContentsItem(title:"問合わせ先一覧", fileName:"201_01_ごみ分けガイド表紙・裏表紙（問合わせ先一覧）", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"【特集】ごみを減らす。未来を創造する。", fileName:"201_02_【特集】ごみを減らす。未来を創造する。", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"資源とごみの分け方・出し方一覧", fileName:"201_03_資源とごみの分け方・出し方一覧", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"指定ごみ袋まるわかり解説／排出ルール", fileName:"201_04_指定ごみ袋まるわかり解説／排出ルール", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"燃やせるごみ（有料）週2回", fileName:"201_05_燃やせるごみ（有料）週2回", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"燃やせないごみ（有料）4週1回", fileName:"201_06_燃やせないごみ（有料）4週1回", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"容器包装プラスチック（無料）週1回", fileName:"201_07_容器包装プラスチック（無料）週1回", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"びん・缶・ペットボトル（無料）週1回／枝・葉・草（無料）", fileName:"201_08_びん・缶・ペットボトル（無料）週1回／枝・葉・草（無料）", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"雑がみ（無料）2週1回", fileName:"201_09_雑がみ（無料）2週1回", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"大型ごみ（有料）週1回", fileName:"201_10_大型ごみ（有料）週1回", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"大型ごみの申込方法と手順／主な大型ごみの処理手数料", fileName:"201_11_大型ごみの申込方法と手順／主な大型ごみの処理手数料", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"集団資源回収／資源物の回収拠点", fileName:"201_12_集団資源回収／資源物の回収拠点", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"小型家電リサイクル地区リサイクルセンター／家庭系古紙引取案内", fileName:"201_13_小型家電リサイクル地区リサイクルセンター／家庭系古紙引取案内", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"生ごみリサイクル／さわやか収集／ライターのガスの抜き方", fileName:"201_14_生ごみリサイクル／さわやか収集／ライターのガスの抜き方", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"資源のゆくえ（札幌市のリサイクル）", fileName:"201_15_資源のゆくえ（札幌市のリサイクル）", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"自己搬入（家庭ごみを自分で持ち込むこともできます）／市が収集しないもの(処理が困難なもの・危険物など)", fileName:"201_16_自己搬入（家庭ごみを自分で持ち込むこともできます）／市が収集しないもの(処理が困難なもの・危険物など)", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"市が収集しないもの(家電4品目・パソコン）", fileName:"201_17_市が収集しないもの(家電4品目・パソコン）", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"資源物の回収拠点一覧", fileName:"201_18_資源物の回収拠点一覧", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            ContentsItem(title:"資源とごみの分別辞典", fileName:"201_19_資源とごみの分別辞典", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイドダウンロード", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/download.html"),
            
            
            
            ContentsItem(title:"ごみ情報（English）", fileName:"garbage_english", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイド外国語版", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/foreign.html"),
            
            ContentsItem(title:"ごみ情報（Korean）", fileName:"garbage_korean", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイド外国語版", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/foreign.html"),
            
            ContentsItem(title:"ごみ情報（Chinese）", fileName:"garbage_chinese", fileType:"pdf", purposeType:"PDF",
                contentsName:"ごみ分けガイド外国語版", contentsUrl:"http://www.city.sapporo.jp/seiso/gomi/gomiwake_guide/foreign.html")
        ])
    }
}
