#Requires AutoHotkey v2.0

;open saved websites hotkey
~^+h:: {
    file_path := "storage_files\saved_websites.txt"
    file_contents := FileRead(file_path)
    
    lines := StrSplit(file_contents, "`n", "`r")

    for line in lines{
        Run line
    }
}