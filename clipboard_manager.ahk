#Requires AutoHotkey v2.0

clips := []
MyMenu := Menu()

clear_clips(*){
    global clips, MyMenu
    clips := []
    MyMenu := Menu()
}

take_clip(data_type){
    global clips
    if (data_type == 1){
    clips.Push(A_Clipboard)
    }
}
OnClipboardChange(take_clip)


~!AppsKey::{
    global clips, MyMenu

    MyMenu := Menu()

    if (clips.length == 0){
    MyMenu.Add("No clips taken!", (*) => "")
    MyMenu.Show()
    return
    }

    for index, clip in clips{
        if (StrLen(clip) > 50){
            text := SubStr(clip, 1, 47) "..."
        } else {
            text := clip
        }
        MyMenu.Add(text, ((currentClip) => (*) => (A_Clipboard := currentClip))(clip))
    }

    MyMenu.Add()
    MyMenu.Add("Clear all clips!", clear_clips)

    MyMenu.Show()
}