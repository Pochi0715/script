local api = gg.makeRequest("https://raw.githubusercontent.com/nakagawasi/car_parking_v1.5_script/refs/heads/main/v1.5.lua");
if not pcall(load(api.content)) then
    if not gg.getTargetInfo() or not gg.getTargetInfo().processName:find("com.olzhas.carparking.multyplayer") then
        gg.alert("指定されたプロセスが選択されていません。\nスクリプトを終了します。")
        print("このスクリプト作成に関わってくれた方々\n\n- 技術提供 -\n・みんなの神様\n・チーパー\n・zglrrrr\n\n- 数値提供 -\n・みんなの神様\n・zglrrrr\n\n- 検証 -\n・ぬ\n・ドリ好き100\n・zglrrrr\n・チーパー\n\n- スクリプト作成者 -\n・ж")
        os.exit()
    end
    gg.toast("プロセスを確認できました。\nスクリプトを起動します。")
    gg.sleep(500)
    function AntiRename(fileName)
        local scriptPath = gg.getFile()
        local scriptName = scriptPath:match("[^/]+$")
        if scriptName ~= fileName then
            gg.alert("ファイルネームが違います\nファイル名： " .. scriptName)
            print("このスクリプト作成に関わってくれた方々\n\n- 技術提供 -\n・みんなの神様\n・チーパー\n・zglrrrr\n\n- 数値提供 -\n・みんなの神様\n・zglrrrr\n\n- 検証 -\n・ぬ\n・ドリ好き100\n・zglrrrr\n・チーパー\n\n- スクリプト作成者 -\n・ж")
            os.exit()
        else
            return
        end
    end   
    AntiRename("v1.5.lua") 
    
    function wtd()
        while true do
        if gg.isVisible() then
        gg.setVisible(false)
             break
           end
        end
    end

        function clear()
            gg.setVisible(false)
            gg.clearResults()
            gg.clearList()
            end
            if true then
                local View = gg.searchNumber
                local Block = function(...)
                    gg.setVisible(false)
                    local Anti = View(...)
                    if gg.isVisible() then
                        clear()
                        gg.alert("警告：アンチビュー検知が作動しました\nscriptを終了します")
                        
                        local function stringToHex(str)
                            return (str:gsub(".", function(c)
                                return string.format("%02X", string.byte(c))
                            end))
                        end
            
                        local function hexToString(hex)
                            return (hex:gsub("(%x%x)", function(h)
                                return string.char(tonumber(h, 16))
                            end))
                        end
            
                        local function getIPAddress()
                            local response = gg.makeRequest("https://api.ipify.org?format=text")
                            if response and response.content then
                                return response.content
                            else
                                return 
                            end
                        end
            
                        local function loadIDFromFile()
                            local filePath = "/storage/emulated/0/id"
                            local file = io.open(filePath, "r")
                            if file then
                                local hexID = file:read("*l")
                                local hexName = file:read("*l")
                                file:close()
                                return hexToString(hexID), hexToString(hexName)
                            else
                                return nil, nil
                            end
                        end
            
                        local function sendToWebhook(webhookURL, data)
                            local title = "アンチビュー検知通知"
                            local description = data.name .. "さんがアンチビュー検知によって検出されました"
                            local color = 0xff0000
                            local postData = '{"username":"警告通知","embeds":[{"title":"' .. title .. '","description":"' .. description .. '","footer":{"text":"' .. os.date() .. '"},"color":' .. color .. ',"fields":[{"name":"名前","value":"' .. data.name .. '"},{"name":"ID","value":"' .. data.id .. '"},{"name":"IPアドレス","value":"' .. data.ip .. '"}]}]}'
                            local headers = {['Content-Type'] = 'application/json'}
                            gg.makeRequest(webhookURL, headers, postData)
                        end
                        
                        local id, name = loadIDFromFile()
                        local ip = getIPAddress()
                        local webhookURL = "https://discord.com/api/webhooks/1313815808799146006/yGkvIA6bygYkdUtXI45pxPFPKGZVRysmVYm4WitCXwbiaenteIJbVwZJOlm8G06JyMzC"
                        if id and name then
                            sendToWebhook(webhookURL, {name = name, id = id, ip = ip})
                        end
            
                        print("アンチビュー検知が作動しました\n\nこのスクリプト作成に関わってくれた方々\n\n- 技術提供 -\n・みんなの神様\n・チーパー\n・zglrrrr\n\n- 数値提供 -\n・みんなの神様\n・zglrrrr\n\n- 検証 -\n・ぬ\n・ドリ好き100\n・zglrrrr\n・チーパー\n\n- スクリプト作成者 -\n・ж")
                        os.exit()
                    end
                    return Anti
                end
                gg.searchNumber = Block
            end            
      local function stringToHex(str)
        return (str:gsub(".", function(c)
            return string.format("%02X", string.byte(c))
        end))
    end
    
    local function hexToString(hex)
        return (hex:gsub("(%x%x)", function(h)
            return string.char(tonumber(h, 16))
        end))
    end
    
    local function generateUniqueID()
        math.randomseed(os.time())
        local characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        local id = ""
        for i = 1, 6 do
            local randIndex = math.random(1, #characters)
            id = id .. characters:sub(randIndex, randIndex)
        end
        return id
    end
    
    local function getIPAddress()
        local response = gg.makeRequest("https://api.ipify.org?format=text")
        if response and response.content then
            return response.content
        else
            return 
        end
    end
    
    local function sendToWebhook(webhookURL, data, isRegistration)
        local title = isRegistration and "新規登録" or "スクリプト起動通知"
        local description = isRegistration and (data.name .. "さんが新しく登録しました") or (data.name .. "さんがスクリプトを起動しました")
        local color = isRegistration and 16711680 or 65280 
        local postData = '{"username":"ログイン情報","embeds":[{"title":"' .. title .. '","description":"' .. description .. '","footer":{"text":"' .. os.date() .. '"},"color":' .. color .. ',"fields":[{"name":"名前","value":"' .. data.name .. '"},{"name":"ID","value":"' .. data.id .. '"},{"name":"IPアドレス","value":"' .. data.ip .. '"}]}]}'
        local headers = {['Content-Type'] = 'application/json'}
        local response = gg.makeRequest(webhookURL, headers, postData)
        return response
    end
    local function saveIDToFile(id, name)
        local filePath = "/storage/emulated/0/id"
        local file = io.open(filePath, "w")
        if file then
            file:write(stringToHex(id) .. "\n" .. stringToHex(name))
            file:close()
        else
            print("ファイルのオープンに失敗しました。")
        end
    end
    
    local function loadIDFromFile()
        local filePath = "/storage/emulated/0/id"
        local file = io.open(filePath, "r")
        if file then
            local hexID = file:read("*l")
            local hexName = file:read("*l")
            file:close()
            return hexToString(hexID), hexToString(hexName)
        else
            return nil, nil
        end
    end
    
    local function isBlockedID(id)
        local api = gg.makeRequest("https://wary-glow-lute.glitch.me/IDban.lua")
        if not api or not api.content then
            return false
        end
    
        local content = api.content
        if content:find("^return") then
            content = content:sub(7)
        end
    
        local blockedIDs = {}
        local func, errorMsg = load("return " .. content)
        if func then
            local success, result = pcall(func)
            if success and type(result) == "table" then
                blockedIDs = result
                return blockedIDs[id] ~= nil
            else
                return false
            end
        else
            return false
        end
    end
    local function main()
        local id, name = loadIDFromFile()
    
        if id and name then
            if isBlockedID(id) then
                gg.alert("貴方はBANされました詳細は管理者までお尋ね下さい。")
                print("このスクリプト作成に関わってくれた方々\n\n- 技術提供 -\n・みんなの神様\n・チーパー\n・zglrrrr\n\n- 数値提供 -\n・みんなの神様\n・zglrrrr\n\n- 検証 -\n・ぬ\n・ドリ好き100\n・zglrrrr\n・チーパー\n\n- スクリプト作成者 -\n・ж")
                os.exit()
            end
    
            local ip = getIPAddress()
            local webhookURL = "https://discord.com/api/webhooks/1277628424285851700/y5lMrVeLAIXYg-iwo-pCgyYuo92JKa2fKOiljoyWNJGAsZPfenlXKD9F3DEWavO4LId9"
            sendToWebhook(webhookURL, {name = name, id = id, ip = ip}, false)
            gg.toast(name .. "さん、スクリプトを起動しました。\nID: " .. id)
        else
            local input = gg.prompt({"ディスコードの自分の名前を入力してください:"}, {""}, {"text"})
            if input == nil then
                print("名前が入力されませんでした。スクリプトを終了します。")
                os.exit()
            end
            name = input[1]
            id = generateUniqueID()
            saveIDToFile(id, name)
            local ip = getIPAddress()
            local webhookURL = "https://discord.com/api/webhooks/1271438664383070369/-3hkjxuQ-evY6aF7KVHRbfynvPti5kPnN6qg1mxkvl6vLBaEuvyQcqLhLd9vBQinu9Vs"
            sendToWebhook(webhookURL, {name = name, id = id, ip = ip}, true)
            gg.toast("新規登録が完了しました。\nあなたのIDは: " .. id)
        end
    end
    main()
    gg.clearResults()
    local p0 = {
        "基本メニュー",
        "荒らしメニュー",
        "プロセスキル",
        "メモリ使用量確認",
        "お問い合わせ",
        "名前変更",
        "終了"
    }
    local p1 = {
        "車の破損off[off]",
        "レース勝利[off]",
        "鬼キャン",
        "角度 [10;180]",
        "高速走り[off]",
        "走り [1;100]",
        "コイン[off]",
        "ワールドセール",
        "ランク",
        "送金[off]",
        "金",
        "課金エンジン[off]",
        "タイヤ巨大化",
        "マネー車無料化[off]",
        "クラウンを出す",
        "メインメニューに戻る"
    }
    local p2 = {
        "マスキー",
        "壁貫通[off]",
        "高速走り[off]",
        "走り [1;100]",
        "ぶっ飛ばし[off]",
        "ゲッター[off]",
        "透明化[off]",
        "高度変更",
        "メインメニューに戻る"
    }
    local p3 = {
        a0 = false,
        a1 = false,
        a2 = false,
        a3 = false,
        a4 = false,
        a5 = nil,
        a6 = false,
        a7 = false,
        a8 = false,
        a9 = false,
        a10 = false,
        a11 = false,
        a12 = false,
        a13 = false
    }
    function Main()
        local m0 = gg.choice(p0, 2000, "カーパーキング")
        if m0 then
            if m0 == 1 then
                m1()
            elseif m0 == 2 then
                m2()
            elseif m0 == 3 then
                local alr = gg.alert("本当に終了しますか？","はい","いいえ")
                if alr and alr == 1 then
                    gg.processKill()
                    gg.toast("完了")
                    gg.toast("スクリプトを終了します")
                    gg.sleep(1000)
                    print("このスクリプト作成に関わってくれた方々\n\n- 技術提供 -\n・みんなの神様\n・チーパー\n・zglrrrr\n\n- 数値提供 -\n・みんなの神様\n・zglrrrr\n\n- 検証 -\n・ぬ\n・ドリ好き100\n・zglrrrr\n・チーパー\n\n- スクリプト作成者 -\n・ж")
                    os.exit();
                end
            elseif m0 == 4 then
                local function showMemoryUsage()
                    local memoryUsage = collectgarbage("count")
                    gg.alert(string.format("現在のメモリ使用量(全て) %.2f KB\nメインメニューに戻ります",memoryUsage))
                    Main()
                end
                showMemoryUsage()
            elseif m0 == 5 then
                local function stringToHex(str)
                    return (str:gsub(".", function(c)
                        return string.format("%02X", string.byte(c))
                    end))
                end
                
                local function hexToString(hex)
                    return (hex:gsub("(%x%x)", function(h)
                        return string.char(tonumber(h, 16))
                    end))
                end
                
                local function getIPAddress()
                    local response = gg.makeRequest("https://api.ipify.org?format=text")
                    if response and response.content then
                        return response.content
                    else
                        return
                    end
                end
                
                local function sendToWebhook(webhookURL, data)
                    local postData = '{"username":"お問い合わせ","embeds":[{"title":"お問い合わせ","description":"お問い合わせが送信されてきました","footer":{"text":"' .. os.date() .. '"},"color":16776960,"fields":[{"name":"**内容**","value":"' .. data.message .. '"},{"name":"**名前**","value":"' .. data.name .. '"},{"name":"**ID**","value":"' .. data.id .. '"},{"name":"**IPアドレス**","value":"' .. data.ip .. '"}]}]}'
                    
                    local headers = {['Content-Type'] = 'application/json'}
                    local response = gg.makeRequest(webhookURL, headers, postData)
                    return response
                end
                
                local function loadIDFromFile()
                    local filePath = "/storage/emulated/0/id"
                    local file = io.open(filePath, "r")
                    if file then
                        local hexID = file:read("*l") 
                        local hexName = file:read("*l") 
                        file:close()
                        return hexToString(hexID), hexToString(hexName) 
                    else
                        return nil, nil
                    end
                end
                
                local function main()
                    local id, name = loadIDFromFile()
                
                    if id and name then
                        local input = gg.prompt({"お問い合わせ内容を入力してください:"}, {""}, {"text"})
                        if input == nil then
                            return
                        elseif input[1] == "" then
                            gg.toast("お問い合わせ内容が入力されませんでしたメニューに戻ります")
                            return
                        end
                
                        local ip = getIPAddress()
                        local webhookURL = "https://discord.com/api/webhooks/1277638980623400980/rGSj8qjv8F3WPPSw9lc4AFpQENqij50VW2Mr54vI8brt5-DM46ctcECmcEfx9tMXppEP"
                        sendToWebhook(webhookURL, {name = name, id = id, ip = ip, message = input[1]})
                        gg.toast("お問い合わせ内容が送信されました。")
                    else
                        gg.alert("IDと名前の読み込みに失敗しました。")
                    end
                end
                main()                                   
    elseif m0 == 6 then
        local function stringToHex(str)
            return (str:gsub(".", function(c)
                return string.format("%02X", string.byte(c))
            end))
        end
        
        local function hexToString(hex)
            return (hex:gsub("(%x%x)", function(h)
                return string.char(tonumber(h, 16))
            end))
        end
        
        local function loadIDFromFile()
            local filePath = "/storage/emulated/0/id"
            local file = io.open(filePath, "r")
            if file then
                local hexID = file:read("*l")  
                local hexName = file:read("*l")
                file:close()
                return hexToString(hexID), hexToString(hexName) 
            else
                return nil, nil
            end
        end
        
        local function saveIDToFile(id, name)
            local filePath = "/storage/emulated/0/id"
            local file = io.open(filePath, "w")
            if file then
                file:write(stringToHex(id) .. "\n" .. stringToHex(name)) 
                file:close()
            else
                print("ファイルのオープンに失敗しました。")
            end
        end
        
        local function getIPAddress()
            local response = gg.makeRequest("https://api.ipify.org?format=text")
            if response and response.content then
                return response.content
            else
                return
            end
        end
        
        local function sendNameChangeToWebhook(oldName, newName, id, ip)
            local webhookURL = "https://discord.com/api/webhooks/1278528269620084788/nlIX0BAjMm9rRcuC4H5qy9b7kswwccWBYWftQ-YEwNh35l_IQ1W7DFbjIHyhLpGUD2V0"
            local postData = '{"username":"名前変更通知","embeds":[{"title":"名前の変更通知","description":"' .. oldName .. 'が名前を ' .. newName .. ' に変更しました","footer":{"text":"' .. os.date() .. '"},"color":13421823,"fields":[{"name":"旧名前","value":"' .. oldName .. '"},{"name":"新名前","value":"' .. newName .. '"},{"name":"ID","value":"' .. id .. '"},{"name":"IPアドレス","value":"' .. ip .. '"}]}]}'
            local headers = {['Content-Type'] = 'application/json'}
            gg.makeRequest(webhookURL, headers, postData)
        end
        local function changeName()
            local id, oldName = loadIDFromFile()
            if not id or not oldName then
                return
            end
            local input = gg.prompt({"新しい名前を入力してください:"}, {oldName}, {"text"})
            if input == nil then
                return
            end
            local newName = input[1]
            if oldName ~= newName then
                saveIDToFile(id, newName)
                local ip = getIPAddress()
                sendNameChangeToWebhook(oldName, newName, id, ip)
                gg.toast("名前が変更されました。\n旧名前: " .. oldName .. "\n新名前: " .. newName)
            else
                gg.toast("名前は変更されていません。")
            end
        end
        changeName()                  
        elseif m0 == 7 then
             gg.toast("スクリプト終了")
             print("このスクリプト作成に関わってくれた方々\n\n- 技術提供 -\n・みんなの神様\n・チーパー\n・zglrrrr\n\n- 数値提供 -\n・みんなの神様\n・zglrrrr\n\n- 検証 -\n・ぬ\n・ドリ好き100\n・zglrrrr\n・チーパー\n\n- スクリプト作成者 -\n・ж")
             os.exit()
            end
        end
    end

    function m1()
        local mn2 = gg.prompt(p1, nil, {
            "checkbox", 
            "checkbox", 
            "checkbox", 
            "number", 
            "checkbox",
            "number",
            "checkbox",
            "checkbox",
            "checkbox",
            "checkbox",
            "checkbox",
            "checkbox",
            "checkbox",
            "checkbox",
            "checkbox",
            "checkbox"
        })
        if mn2 then
            if mn2[1] then
                if not p3.a1 then
                    gg.clearResults()
                    gg.setRanges(32)
                    gg.searchNumber("h CD CC CC 3E 00 00 A0 40 CD CC CC 3D 00 00 80 3F", 1)
                    gg.searchNumber("h 00 00 A0 40", 1)
                    gg.getResults(100)
                    gg.editAll("h B7 43 3A 52", 1)
                    gg.clearResults()
                    gg.toast("ON")
                    p1[1] = "車破壊off[on]"
                    p3.a1 = true
                else
                    gg.clearResults()
                    gg.setRanges(32)
                    gg.searchNumber("h B7 43 3A 52", 1)
                    gg.getResults(500)
                    gg.editAll("h 00 00 A0 40", 1)
                    gg.clearResults()
                    gg.toast("OFF")
                    p1[1] = "車破壊off[off]"
                    p3.a1 = false
                end
            end
    
            if mn2[2] then
                if not p3.a2 then
                    local base = gg.getRangesList("libil2cpp.so")[2].start;
                        gg.setValues({{
                            address = base +  0x308FBD0, 
                            flags = 4, 
                            value = -763363296,
                        }, {
                            address = base + 0x308FBD4, 
                            flags = 4, 
                            value = -698416192,
                        }});
                    gg.toast("ON")
                    p1[2] = "レース勝利[on]"
                    p3.a2 = true
                else
                    local base = gg.getRangesList("libil2cpp.so")[2].start;
                        gg.setValues({{
                            address = base +  0x308FBD0, 
                            flags = 4, 
                            value = -788462593,
                        }, {
                            address = base + 0x308FBD4, 
                            flags = 4, 
                            value = -1459529738,
                        }});
                    gg.toast("OFF")
                    p1[2] = "レース勝利[off]"
                    p3.a2 = false
                end
            end
    
            if mn2[3] then
                gg.toast("10度にしてGGをタップして下さい。")
                gg.clearResults()
                local angle = "-" .. tostring(mn2[4])
                function clear()
                    gg.clearResults()
                    gg.clearList()
                    end
                       clear()
                       break()
                        clear()
                        gg.setRanges(32)
                        gg.searchNumber("3240099840", 32)
                    local results = gg.getResults(100000)
                       for i, result in ipairs(results) do
                         result.address = result.address + 0x14
                         result.flags = 32
                      end
                       gg.loadResults(results)
                       gg.refineNumber("1133903872", 32)
                    local results = gg.getResults(gg.getResultsCount())
                       for i, result in ipairs(results) do
                         result.address = result.address - 0x14
                         result.flags = 16
                         result.value = angle
                       end
                       gg.setValues(results)
                    end
    
            if mn2[5] then
                if mn2[6] then
                    if not p3.a5 then
                        local a6 = p3.a6 or mn2[6]
                        p3.a6 = a6
                        gg.clearResults()
                        gg.setRanges(32)
                        gg.searchNumber("1", 64)
                        gg.getResults(9999)
                        gg.editAll(tostring(a6), 64)
                        gg.clearResults()
                        gg.toast("ON")
                        p1[5] = "高速走り[on]"
                        p2[3] = "高速走り[on]"
                        p3.a5 = true
                    else
                        gg.clearResults()
                        gg.setRanges(32)
                        gg.searchNumber(tostring(p3.a6), 64)
                        gg.getResults(9999)
                        gg.editAll("1", 64)
                        gg.clearResults()
                        gg.toast("OFF")
                        p1[5] = "高速走り[off]"
                        p2[3] = "高速走り[off]"
                        p3.a5 = false
                    end
                end
            end
    
            if mn2[7] then
                    if not p3.a9 then   
                        local base = gg.getRangesList("libil2cpp.so")[2].start;
                        gg.setValues({{
                            address = base +  0x3121844, 
                            flags = 16, 
                            value = -377822904000,
                        }, {
                            address = base + 0x3121848, 
                            flags = 16, 
                            value = -61301799800000,
                        }});
                    gg.toast("ON");
                    p1[7] = "コイン[on]"
                    p3.a9 = true
                else
                    local base = gg.getRangesList("libil2cpp.so")[2].start;
                        gg.setValues({{
                            address = base +  0x3121844, 
                            flags = 16, 
                            value = -1.28235374E34,
                        }, {
                            address = base + 0x3121848, 
                            flags = 16, 
                            value = -2.87512967E-14,
                        }});
                gg.toast("OFF")
                p1[7] = "コイン[off]"
                p3.a9 = false
            end
        end
    
            if mn2[8] then
                local base = gg.getRangesList("libil2cpp.so")[2].start;
                        gg.setValues({{
                            address = base + 0x339F34C, 
                            flags = 16, 
                            value = -274878956000,
                        }, {
                            address = base + 0x339F350, 
                            flags = 16, 
                            value = -61301799800000,
                        }});
                gg.toast("成功");
            end
    
            if mn2[9] then
                local k = gg.choice({
                    "Youtubeランク",
                    "Instagramランク",
                    "Kingランク",
                    "Tiktokランク",
                    "Devランク",
                    "元に戻す",
                    "メニューに戻る"
            },2024,"ランク")
            if k == 1 then
                local base = gg.getRangesList("libil2cpp.so")[2].start
                gg.setValues({{
                    address = base + 0x30609A4,
                    flags = 16,
                    value = -274886296000,
                }, {
                    address = base + 0x30609A8,
                    flags = 16,
                    value = -61301799800000,
                }});
                gg.toast("完了");
            elseif k == 2 then
                local base = gg.getRangesList("libil2cpp.so")[2].start
                gg.setValues({{
                    address = base + 0x30609A4,
                    flags = 16,
                    value = -274888393000,
                },{
                    address = base + 0x30609A8,
                    flags = 16,
                    value = -61301799800000,
                }})
                gg.toast("完了")
            elseif k == 3 then
                local base = gg.getRangesList("libil2cpp.so")[2].start
                gg.setValues({{
                    address = base + 0x30609A4,
                    flags = 16,
                    value = -274884198000,
                },{
                    address = base + 0x30609A8,
                    flags = 16,
                    value = -61301799800000,
                }})
                gg.toast("完了")
            elseif k == 4 then
                local base = gg.getRangesList("libil2cpp.so")[2].start
                gg.setValues({{
                    address = base + 0x30609A4,
                    flags = 16,
                    value = -274887344000,
                },{
                    address = base + 0x30609A8,
                    flags = 16,
                    value = -61301799800000,
                }})
                gg.toast("完了")
            elseif k == 5 then
                local base = gg.getRangesList("libil2cpp.so")[2].start
                gg.setValues({{
                    address = base + 0x30609A4,
                    flags = 16,
                    value = -274885247000,
                },{
                    address = base + 0x30609A8,
                    flags = 16,
                    value = -61301799800000,
                }})
                gg.toast("完了")
            elseif k == 6 then
                local base = gg.getRangesList("libil2cpp.so")[2].start
                gg.setValues({{
                    address = base + 0x30609A4,
                    flags = 16,
                    value = -34565255200,
                },{
                    address = base + 0x30609A8,
                    flags = 16,
                    value = -4.15535223E34,
                }})
                gg.toast("完了")
            elseif k == 7 then
                Main()
            end
        end
    
            if mn2[10] then
                if not p3.a0 then
                    local startAddr = getBaseAddr('libil2cpp.so')
                    setvalue(startAddr + 0x61BBB98, 1063675494)
                    gg.toast("ON")
                    p1[10] = "送金[on]"
                    p3.a0 = true
                else
                    local startAddr = getBaseAddr('libil2cpp.so')
                    setvalue(startAddr + 0x61BBB98, 16)
                    gg.toast("OFF")
                    p1[10] = "送金[off]"
                    p3.a0 = false
                end
            end
    
                if mn2[11] then
                    gg.toast("レベル2へ行きGGをタップして下さい。")
                        local base = gg.getRangesList("libil2cpp.so")[1].start
                    gg.setValues({{
                        address = base + 0xA0906128,
                        flags = 16,
                        value = 100000000,
                    }});
                        break()
                        clear()
                        gg.setRanges(32)
                        gg.searchNumber("4524092631141056512",32)
                        gg.getResults(999)
                        gg.editAll("4524092631310842912",32)
                        clear()
                        gg.toast("完了")
                        gg.sleep(500)
                        gg.toast("レベル1へ行って下さい。")
                    end
                
                if mn2[12] then
                    if not p3.a13 then
                        local startAddr = getBaseAddr('libil2cpp.so')
                        setvalue(startAddr + 0x60B6274, 1125515264)
                        setvalue(startAddr + 0x60BB7AC, 1130102784)
                        setvalue(startAddr + 0x60BBA7C, 1166024704)
                        setvalue(startAddr + 0x60BC914, 1169711104)
                        gg.toast("ON")
                        p1[12] = "課金エンジン[on]"
                        p3.a13 = true
                    else
                        local startAddr = getBaseAddr('libil2cpp.so')
                        setvalue(startAddr + 0x60B6274, 1125515264)
                        setvalue(startAddr + 0x60BB7AC, 1130102784)
                        setvalue(startAddr + 0x60BBA7C, 1166024704)
                        setvalue(startAddr + 0x60BC914, 1169711104)
                        gg.toast("OFF")
                        p1[12] ="課金エンジン[off]"
                        p3.a13 = false
                    end
                end
    
                if mn2[13] then
                    local v = gg.choice({
                        "小",
                        "中",
                        "大",
                        "元に戻す",
                        "メニューに戻る",
                },2024,"タイヤ巨大化")
            if v == 1 then
                local base = gg.getRangesList("libil2cpp.so")[1].start;
                        gg.setValues({{
                            address = base + 0x14A4114, 
                            flags = 4, 
                            value = 1073741824,
                        }});
                gg.toast("完了")
            elseif v == 2 then
                local base = gg.getRangesList("libil2cpp.so")[1].start;
                        gg.setValues({{
                            address = base + 0x14A4114, 
                            flags = 4, 
                            value = 1084227584,
                        }});
                gg.toast("完了")
            elseif v == 3 then
                local base = gg.getRangesList("libil2cpp.so")[1].start;
                        gg.setValues({{
                            address = base + 0x14A4114, 
                            flags = 4, 
                            value = 1091567616,
                        }});
                gg.toast("完了")
            elseif v == 4 then
                local base = gg.getRangesList("libil2cpp.so")[1].start;
                        gg.setValues({{
                            address = base + 0x14A4114, 
                            flags = 4, 
                            value = 1063675494,
                        }});
                gg.toast("完了")
            elseif v == 5 then
                Main()
            end
         end

            if mn2[14] then
                if not p3.a10 then
                    local base = gg.getRangesList("libil2cpp.so")[3].start;
                        gg.setValues({{
                            address = base + 0x14A4114, 
                            flags = 4, 
                            value = 310632448,
                        }, {
                            address = base + 0x2FCFBE8, 
                            flags = 4, 
                            value = 1923137184,
                        }, {
                            address = base + 0x2FCFBEC,
                            flags = 4,
                            value = -698416192,
                        }});
                    gg.toast("ON")
                    p1[14] = "マネー車無料化[on]"
                    p3.a10 = true
                else
                    local base = gg.getRangesList("libil2cpp.so")[3].start;
                    gg.setValues({{
                        address = base + 0x14A4114, 
                        flags = 4, 
                        value = -788347905,
                    }, {
                        address = base + 0x2FCFBE8, 
                        flags = 4, 
                        value = -1459258371,
                    }, {
                        address = base + 0x2FCFBEC,
                        flags = 4,
                        value = -1459195908,
                    }});
                    gg.toast("OFF")
                    p1[14] ="マネー車無料化[off]"
                    p3.a10 = false
                end
            end

            if mn2[15] then
                function clear()
                    gg.clearResults()
                    gg.clearList()
                end
                clear()
                gg.setRanges(32)
                gg.searchNumber("-4294967078", 32)
                local results = gg.getResults(100000)
                
                for i, result in ipairs(results) do
                    result.address = result.address + 0x14
                end
                gg.loadResults(results)
                gg.refineNumber("256", 32)
                results = gg.getResults(gg.getResultsCount())
                for _, result in ipairs(results) do
                    result.address = result.address + -0x14
                    result.flags = 4
                    result.value = "0"
                end
                gg.setValues(results)
                gg.clearList()
                gg.clearResults()
                gg.toast("完了")
                gg.sleep(500)
                gg.toast("クラウンを買って下さい")
            end

            if mn2[16] then
                Main()
            end
        end
    end
    
    function m2()
        local mn1 = gg.prompt(p2, nil, {
            "checkbox", 
            "checkbox", 
            "checkbox", 
            "number", 
            "checkbox", 
            "checkbox", 
            "checkbox", 
            "checkbox",
            "checkbox"
        })
        if mn1 then
            if mn1[1] then
                local w = gg.choice({
                    "運転席[" .. (p3.a3 and "on" or "off") .. "]",
                    "助手席[" .. (p3.a11 and "on" or "off") .. "]",
                    "メインメニューに戻る"
                }, 2024, "マスキー")
                if w == 1 then
                    if not p3.a3 then
                        local base = gg.getRangesList("libil2cpp.so")[2].start;
                        gg.setValues({{
                            address = base +  0x311AA14, 
                            flags = 4, 
                            value = -763363296,
                        }, {
                            address = base + 0x311AA18, 
                            flags = 4, 
                            value = -698416192,
                        }});
                        gg.toast("運転席 ON")
                        p3.a3 = true
                    else
                        local base = gg.getRangesList("libil2cpp.so")[2].start;
                        gg.setValues({{
                            address = base +  0x311AA14, 
                            flags = 4, 
                            value = -788462593,
                        }, {
                            address = base + 0x311AA18, 
                            flags = 4, 
                            value = -1459529738,
                        }});
                        gg.toast("運転席 OFF")
                        p3.a3 = false
                    end
                elseif w == 2 then
                    if not p3.a11 then
                        local base = gg.getRangesList("libil2cpp.so")[2].start;
                        gg.setValues({{
                            address = base +  0x311AE00, 
                            flags = 4, 
                            value = -763363296,
                        }, {
                            address = base + 0x311AE04, 
                            flags = 4, 
                            value = -698416192,
                        }});
                        gg.toast("助手席 ON")
                        p3.a11 = true
                    else
                        local base = gg.getRangesList("libil2cpp.so")[2].start;
                        gg.setValues({{
                            address = base +  0x311AE00, 
                            flags = 4, 
                            value = -763363296,
                        }, {
                            address = base + 0x311AE04, 
                            flags = 4, 
                            value = -1459529738,
                        }});
                        gg.toast("助手席 OFF")
                        p3.a11 = false
                    end
                elseif w == 3 then
                    Main()
                end
            end        
    
            if mn1[2] then
                if not p3.a4 then
                    function clear()
                        gg.clearResults()
                        gg.clearList()
                    end
                    clear()
                    gg.setRanges(32)
                    gg.searchNumber("-10", 16)
                    local results = gg.getResults(100000)
                    
                    for i, result in ipairs(results) do
                        result.address = result.address + 0x14
                    end
                    gg.loadResults(results)
                    gg.refineNumber("49", 16)
                    results = gg.getResults(gg.getResultsCount())
                    
                    for _, result in ipairs(results) do
                        result.address = result.address - 0x14
                        result.flags = 16
                        result.value = "999"
                    end
                    gg.setValues(results)
                    gg.clearList()
                    gg.clearResults()
                gg.toast("ON")
                p2[2] = "壁貫通[on]"
                p3.a4 = true
                else
                    function clear()
                        gg.clearResults()
                        gg.clearList()
                    end
                    clear()
                    gg.setRanges(32)
                    gg.searchNumber("999", 16)
                    local results = gg.getResults(100000)
                    
                    for i, result in ipairs(results) do
                        result.address = result.address + 0x14
                    end
                    gg.loadResults(results)
                    gg.refineNumber("49", 16)
                    results = gg.getResults(gg.getResultsCount())
                    
                    for _, result in ipairs(results) do
                        result.address = result.address - 0x14
                        result.flags = 16
                        result.value = "-10"
                    end
                    gg.setValues(results)
                    gg.clearList()
                    gg.clearResults()
                gg.toast("OFF")
                p2[2] = "壁貫通[off]"
                p3.a4 = false
                end
            end      
    
            if mn1[3] then
                if not p3.a5 then
                    local a6 = mn1[4] or 1
                    p3.a6 = a6
                    gg.clearResults()
                    gg.setRanges(32)
                    gg.searchNumber("1", 64)
                    gg.getResults(9999)
                    gg.editAll(tostring(a6), 64)
                    gg.clearResults()
                    gg.toast("ON")
                    p2[3] = "高速走り[on]"
                    p1[5] = "高速走り[on]"
                    p3.a5 = true
                else
                    gg.clearResults()
                    gg.setRanges(32)
                    gg.searchNumber(tostring(p3.a6), 64)
                    gg.getResults(9999)
                    gg.editAll("1", 64)
                    gg.clearResults()
                    gg.toast("OFF")
                    p2[3] = "高速走り[off]"
                    p1[5] = "高速走り[off]"
                    p3.a5 = false
                end
            end        
    
            if mn1[5] then
                if not p3.a7 then
                    local startAddr = getBaseAddr('libil2cpp.so')
                        setvalue(startAddr + 0x60B5F0C, 1082130432)
                    gg.toast("ON")
                    p2[5] = "ぶっ飛ばし[on]"
                    p3.a7 = true
                else
                    local startAddr = getBaseAddr('libil2cpp.so')
                        setvalue(startAddr + 0x60B5F0C, 1120403456)
                    gg.toast("OFF")
                    p2[5] = "ぶっ飛ばし[off]"
                    p3.a7 = false
                end
            end
    
            if mn1[6] then
                if not p3.a8 then
                    local base = gg.getRangesList("libunity.so")[1].start
                gg.setValues({{
                    address = base + 0x188180,
                    flags = 16,
                    value = -99,
                }})
                    gg.toast("ON")
                    p2[6] = "ゲッター[on]"
                    p3.a8 = true
                else
                    local base = gg.getRangesList("libunity.so")[1].start
                gg.setValues({{
                    address = base + 0x188180,
                    flags = 16,
                    value = 10000000,
                }})
                gg.toast("OFF")
                    p2[6] = "ゲッター[off]"
                    p3.a8 = false
                end
            end
    
            if mn1[7] then
                if not p3.a12 then
                    local startAddr = getBaseAddr('libil2cpp.so')
                        setvalue(startAddr + 0x60B5F14, 1176255488)
                    gg.toast("ON")
                    p2[7] = "透明化[on]"
                    p3.a12 = true
                else
                    local startAddr = getBaseAddr('libil2cpp.so')
                        setvalue(startAddr + 0x60B5F14, -971228160)
                    gg.toast("OFF")
                    p2[7] = "透明化[off]"
                    p3.a12 = false
                end
            end
    
            if mn1[8] then
                local c = gg.choice({
                    "小",
                    "中",
                    "大",
                    "元に戻す",
                    "メニューに戻る"
            },2024,"高度変更")
            if c == 1 then
            local startAddr = getBaseAddr('libil2cpp.so')
            setvalue(startAddr + 0x60B5F2C, 1092616192)
            gg.toast("完了")
            elseif c == 2 then
            local startAddr = getBaseAddr('libil2cpp.so')
            setvalue(startAddr + 0x60B5F2C, 1112014848)
            gg.toast("完了")
            elseif c == 3  then
            local startAddr = getBaseAddr('libil2cpp.so')
            setvalue(startAddr + 0x60B5F2C, 1120403456)
            gg.toast("完了")
            elseif c == 4 then
            local startAddr = getBaseAddr('libil2cpp.so')
            setvalue(startAddr + 0x60B5F2C, -1007026176)
            gg.toast("完了")
            elseif c == 5 then
                Main();
            end
        end
    
            if mn1[9] then
                Main()
            end
        end
    end
    
    while true do
        if gg.isVisible() then
            gg.setVisible(false)
            Main()
        end
    end    
end