-- Khởi chạy thư viện UI mượt hơn trên Delta
local Library = loadstring(game:HttpGet("https://githubusercontent.com"))()
local Window = Library.CreateLib("Sóc béo - Menu Siêu Tốc", "Midnight")

-- Tạo logo "Sóc béo" hoàng đế hiển thị góc màn hình cho Delta
local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
ScreenGui.Name = "SocBeoLogo"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0, 15, 0, 15) -- Nằm góc trên bên trái
ImageLabel.Size = UDim2.new(0, 65, 0, 65)
ImageLabel.Image = "rbxassetid://13543940175" -- ID hình ảnh chú chó đội mũ hoàng đế

-- Bo tròn ảnh cho đẹp
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = ImageLabel

-- Biến trạng thái farm
getgenv().AutoLift = false
getgenv().AutoAgility = false
getgenv().AutoDurability = false
getgenv().AutoRebirth = false

-- Giao diện điều khiển
local MainTab = Window:NewTab("Auto Farm")
local MainSection = MainTab:NewSection("Sóc Béo Cày Sức Mạnh")

-- 1. Tự động nâng tạ tốc độ 0.0003s
MainSection:NewToggle("Auto Lift (0.0003s)", "Tăng cơ bắp siêu tốc", function(state)
    getgenv().AutoLift = state
    task.spawn(function()
        while getgenv().AutoLift do
            local args = { [1] = "liftweight" }
            game:GetService("Players").LocalPlayer.MuscleLegendsEvents.LiftWeight:FireServer(unpack(args))
            task.wait(0.0003) -- Tốc độ cực hạn Delta
        end
    end)
end)

-- 2. Tự động chạy máy tốc độ 0.0003s
MainSection:NewToggle("Auto Agility (0.0003s)", "Tăng tốc độ di chuyển siêu tốc", function(state)
    getgenv().AutoAgility = state
    task.spawn(function()
        while getgenv().AutoAgility do
            game:GetService("Players").LocalPlayer.MuscleLegendsEvents.RunOnTreadmill:FireServer()
            task.wait(0.0003)
        end
    end)
end)

-- 3. Tự động chống đẩy tốc độ 0.0003s
MainSection:NewToggle("Auto Durability (0.0003s)", "Tăng độ bền bỉ", function(state)
    getgenv().AutoDurability = state
    task.spawn(function()
        while getgenv().AutoDurability do
            local args = { [1] = "pushups" }
            game:GetService("Players").LocalPlayer.MuscleLegendsEvents.DoPushups:FireServer(unpack(args))
            task.wait(0.0003)
        end
    end)
end)

-- 4. Tự động Tái Sinh (Auto Rebirth)
MainSection:NewToggle("Auto Rebirth", "Tự động hồi sinh khi đủ tạ", function(state)
    getgenv().AutoRebirth = state
    task.spawn(function()
        while getgenv().AutoRebirth do
            game:GetService("Players").LocalPlayer.MuscleLegendsEvents.Rebirth:FireServer()
            task.wait(0.5) -- Để 0.5s để Delta không bị quá tải khi đổi cấp
        end
    end)
end)
