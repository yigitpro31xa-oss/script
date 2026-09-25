-- Lua | loader.lua | Roblox Executor Key Sistemi
-- sahtemesaj.com/api/verify?key=KEY → {"valid": true} veya {"valid": false}
-- Kullanım: executor'e key = "KEYIN" yaz, sonra bu dosyayı execute et
-- HWID lock YOK — sadece key kontrolü

-- ─── AYARLAR ──────────────────────────────────────────────────────────────────
local SCRIPT_URL  = "https://raw.githubusercontent.com/yigitpro31xa-oss/sss/refs/heads/main/ss"
local VERIFY_URL  = "https://sahtemesaj.com/api/verify?key="
local KICK_MSG    = "❌ Key Yanlış! sahtemesaj.com'dan geçerli bir key alın."

-- ─── HTTP GET WRAPPER ─────────────────────────────────────────────────────────
-- Synapse X, KRNL, Fluxus, Wave, Solara hepsini dener
local function httpGet(url)
    local ok, res

    -- game:HttpGet (en yaygın)
    ok, res = pcall(function()
        return game:HttpGet(url, true)
    end)
    if ok and type(res) == "string" and res ~= "" then
        return res
    end

    -- syn.request (Synapse X)
    ok, res = pcall(function()
        local r = syn.request({ Url = url, Method = "GET" })
        return r.Body
    end)
    if ok and type(res) == "string" and res ~= "" then
        return res
    end

    -- request() (KRNL, Fluxus, vb.)
    ok, res = pcall(function()
        local r = request({ Url = url, Method = "GET" })
        return r.Body
    end)
    if ok and type(res) == "string" and res ~= "" then
        return res
    end

    -- http_request() (eski executorlar)
    ok, res = pcall(function()
        local r = http_request({ Url = url, Method = "GET" })
        return r.Body
    end)
    if ok and type(res) == "string" and res ~= "" then
        return res
    end

    return nil
end

-- ─── JSON PARSER (sadece "valid" alanı) ──────────────────────────────────────
local function parseValid(jsonStr)
    if not jsonStr then return false end
    local trueMatch  = jsonStr:match('"valid"%s*:%s*(true)')
    local falseMatch = jsonStr:match('"valid"%s*:%s*(false)')
    if trueMatch then return true end
    if falseMatch then return false end
    return false
end

-- ─── BİLDİRİM ────────────────────────────────────────────────────────────────
local function notify(title, body, duration)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title    = title,
            Text     = body,
            Duration = duration or 5,
        })
    end)
end

-- ─── KEY KONTROLÜ ─────────────────────────────────────────────────────────────
local function checkKey(inputKey)
    if not inputKey or type(inputKey) ~= "string" or inputKey == "" then
        return false
    end

    -- Boşlukları temizle
    inputKey = inputKey:match("^%s*(.-)%s*$")

    local url      = VERIFY_URL .. inputKey
    local response = httpGet(url)

    if not response then
        -- Sunucuya ulaşılamadı — güvenli taraf: geçersiz say
        return false
    end

    return parseValid(response)
end

-- ─── KICK ────────────────────────────────────────────────────────────────────
local function kickPlayer(msg)
    local Players = game:GetService("Players")
    local player  = Players.LocalPlayer

    -- Yöntem 1: LocalPlayer:Kick() (çoğu executorda çalışır)
    local ok = pcall(function()
        player:Kick(msg)
    end)
    if ok then return end

    -- Yöntem 2: TeleportService ile boş yere ışınla (yedek)
    pcall(function()
        game:GetService("TeleportService"):Teleport(0, player)
    end)
end

-- ─── ANA AKIŞ ─────────────────────────────────────────────────────────────────
local inputKey = rawget(_G, "key") or rawget(shared, "key") or ""

-- Executor'da "key = ..." satırı _G veya shared'a düşer
-- Eğer ikisinde de yoksa boş string → geçersiz → kick

if not checkKey(inputKey) then
    notify("❌ Key Yanlış", KICK_MSG, 8)
    task.wait(1.5)
    kickPlayer(KICK_MSG)
    return  -- Scriptin geri kalanı çalışmasın
end

-- Key doğru → ana scripti yükle
notify("✅ Key Doğrulandı", "Yükleniyor...", 3)

local scriptContent = httpGet(SCRIPT_URL)

if not scriptContent or scriptContent == "" then
    notify("❌ Hata", "Script yüklenemedi, tekrar dene.", 6)
    return
end

local fn, err = loadstring(scriptContent)
if not fn then
    notify("❌ Hata", "Script parse hatası: " .. tostring(err), 6)
    return
end

-- Scripti çalıştır
local runOk, runErr = pcall(fn)
if not runOk then
    notify("❌ Runtime Hata", tostring(runErr), 6)
end
