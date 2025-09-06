-- RanHub Legal Loader (Versi GUI)
-- by NASAPROGRAMMER

-- Hapus GUI lama
if game.CoreGui:FindFirstChild("RanHubUI") then
    game.CoreGui.RanHubUI:Destroy()
end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RanHubUI"
ScreenGui.Parent = game.CoreGui

-----------------------
-- POPUP WELCOME
-----------------------
local Popup = Instance.new("Frame")
Popup.Size = UDim2.new(0, 300, 0, 120)
Popup.Position = UDim2.new(0.5, -150, 0.5, -60)
Popup.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Popup.BorderSizePixel = 0
Popup.Parent = ScreenGui

local Corner1 = Instance.new("UICorner")
Corner1.CornerRadius = UDim.new(0, 10)
Corner1.Parent = Popup

local PopupText = Instance.new("TextLabel")
PopupText.Size = UDim2.new(1, -20, 1, -20)
PopupText.Position = UDim2.new(0, 10, 0, 10)
PopupText.BackgroundTransparency = 1
PopupText.Text = "Halo " .. game.Players.LocalPlayer.Name .. "!\nSelamat datang di RanHub Legal 😎"
PopupText.Font = Enum.Font.GothamBold
PopupText.TextSize = 18
PopupText.TextWrapped = true
PopupText.TextColor3 = Color3.fromRGB(255, 255, 255)
PopupText.Parent = Popup

-----------------------
-- MAIN HUB (Kotak gede)
-----------------------
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local Corner2 = Instance.new("UICorner")
Corner2.CornerRadius = UDim.new(0, 12)
Corner2.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "RanHub Legal - Main Menu"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.Parent = MainFrame

-- Fungsi tombol
local function makeButton(text, pos, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 460, 0, 40)
    Btn.Position = UDim2.new(0, 20, 0, pos)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Btn.Text = text
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 18
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Parent = MainFrame

    local BC = Instance.new("UICorner")
    BC.CornerRadius = UDim.new(0, 8)
    BC.Parent = Btn

    Btn.MouseButton1Click:Connect(callback)
end

-----------------------
-- 5 TOMBOL ISENG
-----------------------
makeButton("🤯 Gatakin Kepala Temen", 60, function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "RanHub",
        Text = "Wkwkwk kepala temenmu ilang 🤯 (boongan)",
        Duration = 4
    })
end)

makeButton("🥔 Mode Kentang", 110, function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "RanHub",
        Text = "Mode Kentang Aktif! FPS drop (palsu) 🥔",
        Duration = 4
    })
end)

makeButton("🙋 Spam Halo", 160, function()
    for i=1,3 do
        game.StarterGui:SetCore("SendNotification", {
            Title = "RanHub",
            Text = "Halo " .. game.Players.LocalPlayer.Name .. " 🙋",
            Duration = 2
        })
        task.wait(1)
    end
end)

makeButton("❤️ Bucin Mode", 210, function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "RanHub",
        Text = "Aku cinta kamu, " .. game.Players.LocalPlayer.Name .. " ❤️",
        Duration = 5
    })
end)

makeButton("🔊 Jumpscare Sound", 260, function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://4590657391" -- suara random
    sound.Parent = game.Workspace
    sound:Play()
    game.StarterGui:SetCore("SendNotification", {
        Title = "RanHub",
        Text = "BOOM! 🔊",
        Duration = 3
    })
end)

-----------------------
-- Timer Popup -> Main Hub
-----------------------
task.delay(10, function()
    Popup:Destroy()
    MainFrame.Visible = true
end)
