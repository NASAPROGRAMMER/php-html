-- LegalLoader.lua
-- Script pembelajaran, bukan exploit!

-- Banner di console
local function banner(text)
    print("===================================")
    print("      " .. text)
    print("===================================")
end

-- Loader info
local username = (game.Players.LocalPlayer and game.Players.LocalPlayer.Name) or "Unknown User"
local version = "v1.0.0"
local premium = false -- ubah jadi true kalau mau simulasi premium

-- Print banner
banner("LEGAL LOADER " .. version)
print("👤 User    : " .. username)
print("💎 Premium : " .. tostring(premium))
print("📌 Status  : Loaded Successfully!")
print("")

-- Notifikasi utama
game.StarterGui:SetCore("SendNotification", {
    Title = "✨ Legal Loader ✨",
    Text = "Halo " .. username .. "! Script berhasil dijalankan.",
    Duration = 6
})

-- Simulasi premium check
if premium then
    game.StarterGui:SetCore("SendNotification", {
        Title = "💎 Premium Active",
        Text = "Fitur eksklusif unlocked!",
        Duration = 6
    })
else
    game.StarterGui:SetCore("SendNotification", {
        Title = "🔓 Free Mode",
        Text = "Upgrade ke Premium untuk fitur keren!",
        Duration = 6
    })
end

-- Animasi console sederhana
for i = 1, 3 do
    print("[Loader] Loading" .. string.rep(".", i))
    task.wait(0.5)
end
print("[Loader] ✅ All modules loaded!\n")
