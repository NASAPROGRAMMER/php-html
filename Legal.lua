-- RanHub Legal Loader (Style Compact)
-- by NASAPROGRAMMER

if game.CoreGui:FindFirstChild("RanHubUI") then
    game.CoreGui.RanHubUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RanHubUI"
ScreenGui.Parent = game.CoreGui

-----------------------
-- POPUP WELCOME
-----------------------
local Popup = Instance.new("Frame")
Popup.Size = UDim2.new(0, 280, 0, 100)
Popup.Position = UDim2.new(0.5, -140, 0.5, -50)
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
PopupText.TextSize = 16
PopupText.TextWrapped = true
PopupText.TextColor3 = Color3.fromRGB(255, 255, 255)
PopupText.Parent = Popup

-----------------------
-- MAIN HUB (Compact)
-----------------------
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 480, 0, 260)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local Corner2 = Instance.new("UICorner")
Corner2.CornerRadius = UDim.new(0, 12)
Corner2.Parent = MainFrame

-- HEADER
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -70, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "RanHub Legal"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Tombol Close
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 25)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Parent = Header
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- Tombol Minimize
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 30, 0, 25)
MinBtn.Position = UDim2.new(1, -70, 0, 5)
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 200)
MinBtn.Text = "-"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 16
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.Parent = Header

local Minimized = false
MinBtn.MouseButton1Click:Connect(function()
    Minimized = not Minimized
    for _, child in pairs(MainFrame:GetChildren()) do
        if child ~= Header then
            child.Visible = not Minimized
        end
    end
end)

-----------------------
-- MENU LIST (KIRI KECIL)
-----------------------
local SideMenu = Instance.new("Frame")
SideMenu.Size = UDim2.new(0, 150, 1, -35)
SideMenu.Position = UDim2.new(0, 0, 0, 35)
SideMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
SideMenu.BorderSizePixel = 0
SideMenu.Parent = MainFrame

-----------------------
-- PANEL DETAIL (KANAN KECIL)
-----------------------
local DetailPanel = Instance.new("Frame")
DetailPanel.Size = UDim2.new(1, -150, 1, -35)
DetailPanel.Position = UDim2.new(0, 150, 0, 35)
DetailPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DetailPanel.BorderSizePixel = 0
DetailPanel.Parent = MainFrame

local DetailText = Instance.new("TextLabel")
DetailText.Size = UDim2.new(1, -20, 1, -20)
DetailText.Position = UDim2.new(0, 10, 0, 10)
DetailText.BackgroundTransparency = 1
DetailText.Text = "Pilih menu di kiri"
DetailText.Font = Enum.Font.Gotham
DetailText.TextSize = 16
DetailText.TextWrapped = true
DetailText.TextColor3 = Color3.fromRGB(255, 255, 255)
DetailText.Parent = DetailPanel

-----------------------
-- Fungsi buat tombol menu
-----------------------
local function makeMenu(text, y, onClick)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -20, 0, 35)
    Btn.Position = UDim2.new(0, 10, 0, y)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Btn.Text = text
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 14
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Parent = SideMenu

    local BC = Instance.new("UICorner")
    BC.CornerRadius = UDim.new(0, 6)
    BC.Parent = Btn

    Btn.MouseButton1Click:Connect(onClick)
end

-----------------------
-- 5 MENU ISENG
-----------------------
makeMenu("🤯 Gatakin Kepala", 10, function()
    DetailText.Text = "Kepala temenmu ilang (boongan) 🤯"
end)

makeMenu("❤️ Mode Bucin", 55, function()
    DetailText.Text = "Isi nama bucin kamu disini (dummy) ❤️"
end)

makeMenu("🥔 Mode Kentang", 100, function()
    DetailText.Text = "Mode Kentang aktif! FPS drop palsu 🥔"
end)

makeMenu("🙋 Spam Halo", 145, function()
    DetailText.Text = "Halo Halo Halo 🙋"
end)

makeMenu("🔊 Jumpscare", 190, function()
    DetailText.Text = "BOOM! 🔊 (suara random bakal main)"
end)

-----------------------
-- Timer Popup -> Main
-----------------------
task.delay(10, function()
    Popup:Destroy()
    MainFrame.Visible = true
end)
