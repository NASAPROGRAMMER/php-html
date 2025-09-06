-- LegalLoader_Kece.lua
-- GUI Kotak Besar RanHub

-- Hapus GUI lama kalau ada
if game.CoreGui:FindFirstChild("RanHubUI") then
    game.CoreGui.RanHubUI:Destroy()
end

-- Buat ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RanHubUI"
ScreenGui.Parent = game.CoreGui

-- Buat Frame utama (kotak hitam di tengah)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125) -- Tengah layar
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Tambahkan rounded corner biar kece
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Judul (RanHub)
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "RanHub"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 28
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = MainFrame

-- Subjudul
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, -20, 0, 30)
SubTitle.Position = UDim2.new(0, 10, 0, 60)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Halo " .. (game.Players.LocalPlayer.Name or "User") .. "!"
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 20
SubTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.Parent = MainFrame

-- Mode Info
local Mode = Instance.new("TextLabel")
Mode.Size = UDim2.new(1, -20, 0, 30)
Mode.Position = UDim2.new(0, 10, 0, 100)
Mode.BackgroundTransparency = 1
Mode.Text = "Mode: Free"
Mode.Font = Enum.Font.Gotham
Mode.TextSize = 20
Mode.TextColor3 = Color3.fromRGB(0, 200, 255)
Mode.TextXAlignment = Enum.TextXAlignment.Left
Mode.Parent = MainFrame

-- Status Loading
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -20, 0, 30)
Status.Position = UDim2.new(0, 10, 0, 140)
Status.BackgroundTransparency = 1
Status.Text = "✅ Loader siap digunakan!"
Status.Font = Enum.Font.Gotham
Status.TextSize = 20
Status.TextColor3 = Color3.fromRGB(0, 255, 100)
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.Parent = MainFrame
