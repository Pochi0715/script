if true then
    local org = gg.searchNumber
    local hook = function(...)
        gg.setVisible(false)
        local ret = org(...)
        if gg.isVisible() then
            gg.alert("数値みんな殺すぞ")
            gg.clearResults()
            while true do os.exit() end
        end
        return ret
    end
    gg.searchNumber = hook
end

local requiredProcessName = "com.innersloth.spacemafia"
local currentProcessInfo = gg.getTargetInfo()
if currentProcessInfo == nil then
    os.exit()
end
local currentProcessName = currentProcessInfo.processName
if currentProcessName == nil or not currentProcessName:find(requiredProcessName) then
    gg.alert("指定されたプロセスが選択されていません。\nスクリプトを終了します。")
    print("アモアスを起動してください。")
    os.exit()
end
gg.toast("プロセスを確認できました。\nスクリプトを起動します。")
gg.sleep(500)

gg.alert("このスクリプトはオフセットを使っています。\n使えない場合は別の仮想空間・エミュのバージョンをお使い下さい。\nオンライン更新なので変更がありましたら自動で更新されます。")

local A = {
    "貫通[未実行]",
    "キルタイム無し",
    "ルームのキルタイムを入力",
    "高速移動[未実行]",
    "速度調整 [3;100]",  
    "キル範囲上昇[未実行]",
    "視界[未実行]",
    "終了"
}
local state = {
    I1 = false,
    I2 = false,
    I3 = nil,
    I4 = false,
    I5 = false
}

function Main()
    local mn2 = gg.prompt(A, nil, {
        "checkbox",
        "checkbox",
        "number",
        "checkbox",
        "number", 
        "checkbox",
        "checkbox",
        "checkbox"
    })

    if mn2 then
        if mn2[1] then
            if not state.I1 then
                local base = gg.getRangesList("libunity.so")[1].start
                gg.setValues({
                    {
                        address = base + 0xDC08E4,
                        flags = 16,
                        value = 10
                    }
                })
                gg.toast("ON")
                state.I1 = true
                A[1] = "貫通[実行中]"
            else
                local base = gg.getRangesList("libunity.so")[1].start
                gg.setValues({
                    {
                        address = base + 0xDC08E4,
                        flags = 16,
                        value = -0.1
                    }
                })
                gg.toast("OFF")
                state.I1 = false
                A[1] = "貫通[未実行]"
            end
        end

        if mn2[2] then
            gg.clearResults()
            local angle = tostring(mn2[3])
            gg.clearResults()
            gg.setRanges(32)
            gg.searchNumber("1.0;1~~1;"..(tostring(mn2[3])).."::9", 16)
            gg.searchNumber(tostring(mn2[3]), 16)
            gg.getResults(999)
            gg.editAll("1", 16)
            gg.clearResults()
            gg.toast("完了")
        end

        if mn2[4] then
            if mn2[5] then
                if not state.I3 then
                    local a6 = state.I2 or mn2[5]
                    state.I2 = a6
                    gg.clearResults()
                    gg.setRanges(32)
                    gg.searchNumber("2.5;3.0::5", 16)
                    gg.searchNumber("2.5", 16)
                    gg.getResults(999)
                    gg.editAll(tostring(a6), 16)
                    gg.clearResults()
                    gg.toast("ON")
                    A[4] = "高速移動[実行中]"
                    state.I3 = true
                else
                    gg.clearResults()
                    gg.setRanges(32)
                    gg.searchNumber(tostring(state.I2)..";3.0::5", 16)
                    gg.searchNumber(tostring(state.I2))
                    gg.getResults(9999)
                    gg.editAll("2.5", 16)
                    gg.clearResults()
                    gg.toast("OFF")
                    A[4] = "高速移動[未実行]"
                    state.I3 = false
                end
            end
        end
        

        if mn2[6] then
            if not state.I4 then
                gg.clearResults()
                gg.setRanges(32)
                gg.searchNumber("1.79999995232",16)
                gg.getResults(9999)
                gg.editAll("100000",16)
                gg.toast("ON")
                state.I4 = true
                A[6] = "キル範囲上昇[実行中]"
            else
                gg.clearResults()
                gg.setRanges(32)
                gg.searchNumber("100000",16)
                gg.getResults(9999)
                gg.editAll("1.79999995232",16)
                gg.toast("OFF")
                state.I4 = false
                A[6] = "キル範囲上昇[未実行]"
            end
        end

        if mn2[7] then
        if not state.I5 then
            gg.clearResults()
            gg.setRanges(32)
            gg.searchNumber("-5.0;-5~~-5;10.66666698456::25",16)
            gg.searchNumber("-5",16)
            gg.getResults(999)
            gg.editAll("50",16)
            gg.toast("ON")
            state.I5 = true
            A[7] = "視界[実行中]"
        else
            gg.clearResults()
            gg.setRanges(32)
            gg.searchNumber("50.0;50~~50;10.66666698456::25",16)
            gg.searchNumber("50",16)
            gg.getResults(999)
            gg.editAll("-5",16)
            gg.toast("OFF")
            state.I5 =false
            A[7] = "視界[未実行]"
        end
    end

        if mn2[8] then
            gg.setVisible(true)
            local U = gg.alert("スクリプトを終了しますか？", "いいえ", "はい")
            if U == 1 then
                Main()
            elseif U == 2 then
                print("ご利用頂きありがとうございました。\nスクリプト作成者：ж")
                os.exit()
            end
        end
    end
end

while true do
    if gg.isVisible() then
        gg.setVisible(false)
        Main()
    end
end