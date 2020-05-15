Attribute VB_Name = "Module1"
Option Explicit

'
' 機能　　　: URLからデッキ情報を生成
'
' 返り値　　: { card_id, num }
'
' 引き数　　: ARG1 - デッキURL
'
' 機能説明　: URLからカードidごとの枚数の辞書を作成
'
' 備考　　　:
'

Function getCardIdsByUrl(str_url As String) As Dictionary

    'URLからカードIDの配列を生成
    Dim url As String
    Dim arr_card_id() As String
    
    url = str_url
    arr_card_id = Split(url, "c=")
    arr_card_id = Split(arr_card_id(1), "&")
    arr_card_id = Split(arr_card_id(0), ".")
    
    
    ' カードIDを数えて辞書にする
    Dim deck As New Dictionary
    Dim i As Integer
    Dim card_id As Variant
    
    For Each card_id In arr_card_id
        If deck.Exists(card_id) = False Then
            i = 1
        Else
            i = deck.Item(card_id)
            i = i + 1
            Call deck.Remove(card_id)
        End If
        
        Call deck.Add(card_id, i)
    Next
    
    
    Set getCardIdsByUrl = deck
    
End Function


' 実行サブプロシージャ
'
' 機能　　　: デッキのチェック
'
' 機能説明　: 入力シートのセル(3,2)に入力されているURLから
'                デッキのテーブルを作成し､チェックと一緒に
'                新しいシートに出力する｡が大会要項を満たしているか
'               チェックし､シートを作成
'
' 備考　　　: 入力シート名...""
'                作成されるシート名..."デッキの持ち主の名前&デッキ"
'

Sub Action()

    ' actionのCells(2,2)のURLからカードIDを取得
    Worksheets("action").Activate
    
    Dim deck As Dictionary
    Set deck = getCardIdsByUrl(Cells(3, 2).Value)
    
    ' dbシートのカードIDからカード詳細を取得しシートに出力
    Worksheets("db").Activate
    
    Range("B17:K57").Clear

    With Range("A1").ListObject.Range
        .AutoFilter 1, deck.Keys(), xlFilterValues
        .SpecialCells(xlCellTypeVisible).Copy Sheets("action").Range("B16")
        .AutoFilter
    End With
    
    ' 枚数をシートに出力
    Worksheets("action").Activate
    
    Dim card_id
    For Each card_id In deck.Keys()
'        Debug.Print ("card_id")
'        Debug.Print (card_id)
'        Debug.Print ("deck.Item(card_id)")
'        Debug.Print (deck.Item(card_id))
'        Debug.Print ("Where is deck.Item(card_id)?")
'        Debug.Print (Range(Cells(5, 2), Cells(5 + 40, 2)).Find(card_id).row)
'        Debug.Print ("")
        
        Dim row As Integer
        row = Range(Cells(16, 2), Cells(16 + 40, 2)).Find(card_id).row
        Cells(row, 11).Value = deck.Item(card_id)
    Next
    
    ' シートをコピーする
    Worksheets("action").Copy After:=Worksheets("action")
    
    Dim name As String
    name = Cells(1, 3).Value
    
    ActiveSheet.name = name
    
    Worksheets("action").Activate
    
    
End Sub
