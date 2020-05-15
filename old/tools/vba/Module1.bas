Attribute VB_Name = "Module1"
Option Explicit

'
' �@�\�@�@�@: URL����f�b�L���𐶐�
'
' �Ԃ�l�@�@: { card_id, num }
'
' �������@�@: ARG1 - �f�b�LURL
'
' �@�\�����@: URL����J�[�hid���Ƃ̖����̎������쐬
'
' ���l�@�@�@:
'

Function getCardIdsByUrl(str_url As String) As Dictionary

    'URL����J�[�hID�̔z��𐶐�
    Dim url As String
    Dim arr_card_id() As String
    
    url = str_url
    arr_card_id = Split(url, "c=")
    arr_card_id = Split(arr_card_id(1), "&")
    arr_card_id = Split(arr_card_id(0), ".")
    
    
    ' �J�[�hID�𐔂��Ď����ɂ���
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


' ���s�T�u�v���V�[�W��
'
' �@�\�@�@�@: �f�b�L�̃`�F�b�N
'
' �@�\�����@: ���̓V�[�g�̃Z��(3,2)�ɓ��͂���Ă���URL����
'                �f�b�L�̃e�[�u�����쐬����`�F�b�N�ƈꏏ��
'                �V�����V�[�g�ɏo�͂��顂����v���𖞂����Ă��邩
'               �`�F�b�N����V�[�g���쐬
'
' ���l�@�@�@: ���̓V�[�g��...""
'                �쐬�����V�[�g��..."�f�b�L�̎�����̖��O&�f�b�L"
'

Sub Action()

    ' action��Cells(2,2)��URL����J�[�hID���擾
    Worksheets("action").Activate
    
    Dim deck As Dictionary
    Set deck = getCardIdsByUrl(Cells(3, 2).Value)
    
    ' db�V�[�g�̃J�[�hID����J�[�h�ڍׂ��擾���V�[�g�ɏo��
    Worksheets("db").Activate
    
    Range("B17:K57").Clear

    With Range("A1").ListObject.Range
        .AutoFilter 1, deck.Keys(), xlFilterValues
        .SpecialCells(xlCellTypeVisible).Copy Sheets("action").Range("B16")
        .AutoFilter
    End With
    
    ' �������V�[�g�ɏo��
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
    
    ' �V�[�g���R�s�[����
    Worksheets("action").Copy After:=Worksheets("action")
    
    Dim name As String
    name = Cells(1, 3).Value
    
    ActiveSheet.name = name
    
    Worksheets("action").Activate
    
    
End Sub
