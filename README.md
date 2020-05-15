# dmps_tournament_assist
アプリ"[Duel Masters Plays](https://dmps.takaratomy.co.jp/)"(以下dmpsと略)による大会開催支援ツール

# できること
- デッキ確認の簡易化
- 様々なルールでデッキの確認ができ<s>ます</s>る予定

# 使い方
1. 参加者にデッキコードやデッキURLを送ってもらいましょう。（現状コード→URLは手作業)
1. main.ipynbのcolabリンクから、colabでこのファイルを開いてください。
1. あとはmain.ipynbのテキストに沿って使用してください。

# ファイル構成
~~~
.
├─── README.md      # このファイルのこと
├─── main.ipynb     # 実行ファイル
├─── src            # プログラムファイル
└─── dmps_cards     # デュエプレのカードセット  
~~~


## main.ipynb
実行ファイルです。srcにあるソースコードを使ってデッキ確認を行います。
URLからそのデッキに入っているカードを確認し、大会レギュレーションを
満たしているか確認します。

## src
主に、main.ipynbで使用するソースコードを置いています。

## dmps_cards
デュエプレの全カードセットです。
カードセットごとにcsvファイルを用意しました。
[公式のデッキ編成ページ](https://dmps.takaratomy.co.jp/deckbuilder/)
で生成されるURLをカードIDとし、カード情報と紐づけています。

| ファイル名 | 内容 |
| --- | --- |
| basic | BASIC |
| prize | 全弾のプライズ |
| secret | 全弾のSEC |
| series1 | 超獣の始動 |
| series2 | 伝説の再誕 |
| series3 | 英雄の時空 |

### 更新履歴
- 20200515 第3弾までカードを追加。ただし,3弾SEC,PRコッコは未実装。

# ライセンス
[MITライセンス](https://github.com/kentokura/dmps_tournament_assist/blob/master/LICENSE)です。
- 再配布の際は著作権表示、許諾表示を残してください。
- 無保証です。
- 上記の２つを守れば自由に複製、変更、再配布、販売などに使用可能です。

# 共同開発
募集中です^^

共同開発の手順:
1. [このリポジトリ](https://github.com/kentokura/dmps_tournament_assist)をForkする。
1. フォークしたリポジトリを自身のローカル環境にクローンして、開発する。
1. クローンで行った更新は、フォークしたリポジトリにコミットする。
1. フォークしたリポジトリから[このリポジトリ](https://github.com/kentokura/dmps_tournament_assist)にプルリクエストを送信してください。


