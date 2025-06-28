#Requires AutoHotkey v2.0

~^+h:: {
    file_path := "" ;path to saved_websites.txt
    file_contents := FileRead(file_path)
    
    lines := StrSplit(file_contents, "`n", "`r")

    for line in lines{
        Run line
    }
}