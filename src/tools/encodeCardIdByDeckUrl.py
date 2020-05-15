# coding: utf-8

"""
入力:デッキURL
出力:cardId
処理:
    card_id を重複なく、読み込んだ順番で返す.
用途:
    デュエプレDBの制作に使用.
"""

url = input()

split_key_card = url.split("&")
url_card = split_key_card[0].split("=")
card_id = url_card[1].split(".") 

true_id = list(dict.fromkeys(card_id))

for id in true_id:
    print(id)
    