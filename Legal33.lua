-- GUI UTAMA
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- FRAME MENU
local MenuFrame = Instance.new("Frame")
MenuFrame.Size = UDim2.new(0,150,0,240)
MenuFrame.Position = UDim2.new(0,10,0.5,-120)
MenuFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
MenuFrame.BackgroundTransparency = 0.2
MenuFrame.Parent = ScreenGui

-- FRAME DETAIL + LOG
local DetailFrame = Instance.new("Frame")
DetailFrame.Size = UDim2.new(0,400,0,300)
DetailFrame.Position = UDim2.new(0,170,0.5,-150)
DetailFrame.BackgroundColor3 = Color3.fromRGB(45,45,45)
DetailFrame.BackgroundTransparency = 0.1
DetailFrame.Parent = ScreenGui
DetailFrame.Visible = false

-- TEKS DETAIL
local DetailText = Instance.new("TextLabel")
DetailText.Size = UDim2.new(1,-20,0,60)
DetailText.Position = UDim2.new(0,10,0,10)
DetailText.BackgroundTransparency = 1
DetailText.TextColor3 = Color3.fromRGB(255,255,255)
DetailText.TextWrapped = true
DetailText.TextXAlignment = Enum.TextXAlignment.Left
DetailText.TextYAlignment = Enum.TextYAlignment.Top
DetailText.Font = Enum.Font.SourceSansBold
DetailText.TextSize = 18
DetailText.Parent = DetailFrame

-- SCROLLFRAME LOG
local LogFrame = Instance.new("ScrollingFrame")
LogFrame.Size = UDim2.new(1,-20,1,-80)
LogFrame.Position = UDim2.new(0,10,0,70)
LogFrame.BackgroundTransparency = 1
LogFrame.CanvasSize = UDim2.new(0,0,0,0)
LogFrame.ScrollBarThickness = 6
LogFrame.Parent = DetailFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0,2)
UIListLayout.Parent = LogFrame

-- TOMBOL CLOSE
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0,25,0,25)
CloseBtn.Position = UDim2.new(1,-30,0,5)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
CloseBtn.Parent = DetailFrame
CloseBtn.MouseButton1Click:Connect(function()
    DetailFrame.Visible = false
end)

-- FUNGSI BUAT MENU
local function makeMenu(text,y,callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1,-20,0,40)
    Btn.Position = UDim2.new(0,10,0,y)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Btn.Parent = MenuFrame

    Btn.MouseButton1Click:Connect(function()
        DetailFrame.Visible = true
        callback()
    end)
end

-- 🔍 REMOTEEVENT SPY + GUI LOG
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt,false)
mt.__namecall = function(self,...)
    local method = getnamecallmethod()
    local args = {...}
    if method=="FireServer" or method=="InvokeServer" then
        local logText = string.format("[%s] Remote: %s | Args: %s", method,tostring(self.Name),table.concat(args,", "))
        local logLabel = Instance.new("TextLabel")
        logLabel.Size = UDim2.new(1,0,0,20)
        logLabel.BackgroundTransparency = 1
        logLabel.TextColor3 = Color3.fromRGB(255,255,0)
        logLabel.TextXAlignment = Enum.TextXAlignment.Left
        logLabel.Font = Enum.Font.SourceSans
        logLabel.TextSize = 16
        logLabel.Text = logText
        logLabel.Parent = LogFrame
        logLabel.LayoutOrder = -tick() -- terbaru di atas
        LogFrame.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
    end
    return oldNamecall(self,...)
end
setreadonly(mt,true)

-----------------------
-- MENU 1: TELEPORT MAJU 100M
-----------------------
makeMenu("🤯 Teleport Maju 100M",10,function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector*1900
    DetailText.Text = "Kamu maju 100 meter ke arah pandangan 🤯"
end)

-----------------------
-- MENU 2: AUTO GIFT GUI ASLI
-----------------------
makeMenu("🎁 Auto Gift Backpack",55,function()
    DetailText.Text = "Masukkan username target → semua item non-favorite otomatis digift 🎁"

    local TargetBox = Instance.new("TextBox")
    TargetBox.Size = UDim2.new(1,-20,0,30)
    TargetBox.Position = UDim2.new(0,10,0,100)
    TargetBox.PlaceholderText = "Nama target..."
    TargetBox.TextColor3 = Color3.fromRGB(255,255,255)
    TargetBox.BackgroundColor3 = Color3.fromRGB(70,70,70)
    TargetBox.Parent = DetailFrame

    local function autoGift()
        local targetName = TargetBox.Text
        if targetName=="" then return end

        -- ambil semua item GUI non-favorite
        local backpackGui = player:WaitForChild("PlayerGui"):WaitForChild("BackpackGUI") -- ganti sesuai nama GUI game
        for _,itemFrame in pairs(backpackGui.ItemsFolder:GetChildren()) do
            if not itemFrame.Favorite.Value then
                local giftBtn = itemFrame:FindFirstChild("GiftButton")
                if giftBtn then
                    -- set target
                    local targetBox = backpackGui:FindFirstChild("TargetTextBox")
                    if targetBox then targetBox.Text = targetName end
                    -- klik tombol gift
                    if giftBtn:IsA("TextButton") then
                        giftBtn:Activate()
                    elseif giftBtn:IsA("ClickDetector") then
                        fireclickdetector(giftBtn)
                    end
                end
            end
        end
        DetailText.Text = "🎁 Semua item non-favorite berhasil dikirim ke "..targetName
    end

    -- trigger auto gift ketika username diisi
    TargetBox:GetPropertyChangedSignal("Text"):Connect(autoGift)
end)

-----------------------
-- MENU 3: MODE BUCIN
-----------------------
makeMenu("❤️ Mode Bucin",100,function()
    DetailText.Text = "Isi nama bucin kamu disini (dummy) ❤️"
end)

-----------------------
-- MENU 4: MODE KENTANG
-----------------------
makeMenu("🥔 Mode Kentang",145,function()
    DetailText.Text = "Mode Kentang aktif! FPS drop palsu 🥔"
end)

-----------------------
-- MENU 5: JUMPSCARE
-----------------------
makeMenu("🔊 Jumpscare",190,function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://4590657391"
    sound.Parent = workspace
    sound:Play()

    DetailText.Text = "BOOM! 🔊 (suara random bakal main)"
end)
