-- GUI FRAME UTAMA
local ScreenGui = Instance.new("RanHub")
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
DetailText.Size = UDim2.new(1, -20, 1, -20)
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
-- 5 MENU ISENG
-----------------------
makeMenu("🤯 Teleport Random", 10, function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")

    -- Teleport ke posisi random sekitar 20 stud
    local randomOffset = Vector3.new(
        math.random(-20, 20), 
        0, 
        math.random(-20, 20)
    )
    hrp.CFrame = hrp.CFrame + randomOffset

    DetailText.Text = "Kamu ditransfer ke lokasi random 🤯"
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
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://4590657391" -- contoh jumpscare sound
    sound.Parent = workspace
    sound:Play()

    DetailText.Text = "BOOM! 🔊 (suara random bakal main)"
end)
