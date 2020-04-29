# coding: utf-8
# Your code here!
import csv

def encode_cardd_by_url(url: str) -> dict: 
    """
    入力:デッキURL
    出力:{ card_id, num }
    処理:
        URLから、カードidごとの枚数の辞書を作成する
    """
    
    site_url, card_url = url.split("c=")
    card_url, key_card_url = card_url.split("&")
    arr_card_id = card_url.split(".") 
    
    deck = { card_id: arr_card_id.count(card_id) for card_id in arr_card_id }
    
    return deck
    
# 処理はここから
deck = encode_cardd_by_url(input())
card_details = []

# csvを開く, card_dbはwithを抜けると自動で閉じる
with open('db/csv/dmps_card_db.csv') as card_db:
    reader = csv.reader(f)
    for row in reader:
        for card_id, num in deck.items():
            # keyが存在する行をとってくる
            card_details.append(row.split(","))
            # card_details.append(csv(exist key line).split(","))
    

# 結果出力
for card_detail in card_details:
    print(card_detail)
    
    
