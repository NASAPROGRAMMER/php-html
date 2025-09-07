-- 🔍 REMOTEEVENT SPY (letakkan di awal script)
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" then
        warn("[FIRE SERVER] Remote:", self.Name, "Args:", unpack(args))
    elseif method == "InvokeServer" then
        warn("[INVOKE SERVER] Remote:", self.Name, "Args:", unpack(args))
    end
    return oldNamecall(self, ...)
end
setreadonly(mt, true)

-- GUI FRAME UTAMA
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- FRAME KIRI UNTUK MENU
local MenuFrame = Instance.new("Frame")
MenuFrame.Size = UDim2.new(0, 150, 0, 240)
MenuFrame.Position = UDim2.new(0, 10, 0.5, -120)
MenuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MenuFrame.BackgroundTransparency = 0.2
MenuFrame.Parent = ScreenGui

-- FRAME KANAN UNTUK DETAIL
local DetailFrame = Instance.new("Frame")
DetailFrame.Size = UDim2.new(0, 300, 0, 240)
DetailFrame.Position = UDim2.new(0, 170, 0.5, -120)
DetailFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
DetailFrame.BackgroundTransparency = 0.1
DetailFrame.Parent = ScreenGui
DetailFrame.Visible = false

-- TEKS DETAIL
local DetailText = Instance.new("TextLabel")
DetailText.Size = UDim2.new(1, -20, 0, 80)
DetailText.Position = UDim2.new(0, 10, 0, 10)
DetailText.BackgroundTransparency = 1
DetailText.TextColor3 = Color3.fromRGB(255, 255, 255)
DetailText.TextWrapped = true
DetailText.TextXAlignment = Enum.TextXAlignment.Left
DetailText.TextYAlignment = Enum.TextYAlignment.Top
DetailText.Font = Enum.Font.SourceSansBold
DetailText.TextSize = 18
DetailText.Parent = DetailFrame

-- TOMBOL CLOSE "X"
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -30, 0, 5)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Parent = DetailFrame

CloseBtn.MouseButton1Click:Connect(function()
    DetailFrame.Visible = false
end)

-- FUNCTION UNTUK BIKIN MENU
local function makeMenu(text, y, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -20, 0, 40)
    Btn.Position = UDim2.new(0, 10, 0, y)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Btn.Parent = MenuFrame

    Btn.MouseButton1Click:Connect(function()
        DetailFrame.Visible = true
        callback()
    end)
end

-----------------------
-- MENU 1: TELEPORT
-----------------------
makeMenu("🤯 Teleport Random", 10, function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")

    local randomOffset = Vector3.new(math.random(-20, 20), 0, math.random(-20, 20))
    hrp.CFrame = hrp.CFrame + randomOffset

    DetailText.Text = "Kamu ditransfer ke lokasi random 🤯"
end)

-----------------------
-- MENU 2: AUTO GIFT NON-FAVORITE
-----------------------
makeMenu("🎁 Auto Gift Backpack", 55, function()
    DetailText.Text = "Masukkan username target lalu klik Kirim Gift 🎁"

    local TargetBox = Instance.new("TextBox")
    TargetBox.Size = UDim2.new(1, -20, 0, 30)
    TargetBox.Position = UDim2.new(0, 10, 0, 100)
    TargetBox.PlaceholderText = "Nama target..."
    TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TargetBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    TargetBox.Parent = DetailFrame

    local GiftBtn = Instance.new("TextButton")
    GiftBtn.Size = UDim2.new(0, 120, 0, 30)
    GiftBtn.Position = UDim2.new(0, 10, 0, 140)
    GiftBtn.Text = "Kirim Gift"
    GiftBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    GiftBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 90)
    GiftBtn.Parent = DetailFrame

    local backpack = {
        {name = "Manta Ray", favorite = true},
        {name = "Blob Fish", favorite = false},
        {name = "Shark", favorite = false},
        {name = "Legendary Tuna", favorite = true},
        {name = "Octopus", favorite = false}
    }

    local GiftRemote = Instance.new("RemoteEvent")
    GiftRemote.Name = "GiftRemote"
    GiftRemote.Parent = game.ReplicatedStorage

    GiftBtn.MouseButton1Click:Connect(function()
        local targetName = TargetBox.Text
        if targetName == "" then
            DetailText.Text = "❌ Username target kosong!"
            return
        end

        local giftedCount = 0
        for _, item in ipairs(backpack) do
            if not item.favorite then
                giftedCount += 1
                -- FIRE SERVER -> Spy otomatis akan tampil di output
                GiftRemote:FireServer(item.name, targetName)
            end
        end

        if giftedCount > 0 then
            DetailText.Text = "🎁 "..giftedCount.." item berhasil digift ke "..targetName
        else
            DetailText.Text = "Tidak ada item non-favorite untuk digift."
        end
    end)
end)

-----------------------
-- MENU 3: MODE BUCIN
-----------------------
makeMenu("❤️ Mode Bucin", 100, function()
    DetailText.Text = "Isi nama bucin kamu disini (dummy) ❤️"
end)

-----------------------
-- MENU 4: MODE KENTANG
-----------------------
makeMenu("🥔 Mode Kentang", 145, function()
    DetailText.Text = "Mode Kentang aktif! FPS drop palsu 🥔"
end)

-----------------------
-- MENU 5: JUMPSCARE
-----------------------
makeMenu("🔊 Jumpscare", 190, function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://4590657391"
    sound.Parent = workspace
    sound:Play()

    DetailText.Text = "BOOM! 🔊 (suara random bakal main)"
end)
