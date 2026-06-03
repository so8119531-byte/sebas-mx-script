-- === CONFIGURACIÓN DE LA LLAVE ===
local LLAVE_CORRECTA = "SEBAS_MX_VIP" 

-- === SERVICIOS ===
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse() -- Volvemos al método ultra-rápido instantáneo
local CoreGui = game:GetService("CoreGui")

-- === CONFIGURACIÓN JUEGO ===
local ScriptActivo = true
local TriggerbotEnabled = false
local TriggerDelay = 0 -- 0ms para emparejar tu macro de 1ms
local UltimoDisparo = 0
local Disparando = false 

-- === INTERFAZ DEL SISTEMA DE LLAVES ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SebasMX_KeySystem"
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 300, 0, 160)
KeyFrame.Position = UDim2.new(0.5, -150, 0.4, -80)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = ScreenGui

local KeyBorder = Instance.new("Frame")
KeyBorder.Size = UDim2.new(1, 0, 0, 4)
KeyBorder.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
KeyBorder.BorderSizePixel = 0
KeyBorder.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 30)
KeyTitle.Position = UDim2.new(0, 0, 0, 10)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "SEBAS MX | INSTANT INSTANCE"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 14
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Parent = KeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -40, 0, 35)
KeyInput.Position = UDim2.new(0, 20, 0, 55)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
KeyInput.BorderSizePixel = 0
KeyInput.Text = ""
KeyInput.PlaceholderText = "Escribe la llave aquí..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14
KeyInput.Font = Enum.Font.SourceSans
KeyInput.Parent = KeyFrame

local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(1, -40, 0, 35)
CheckBtn.Position = UDim2.new(0, 20, 0, 105)
CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
CheckBtn.Text = "VERIFICAR LLAVE"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.TextSize = 14
CheckBtn.Font = Enum.Font.SourceSansBold
CheckBtn.Parent = KeyFrame

local CloseKeyBtn = Instance.new("TextButton")
CloseKeyBtn.Size = UDim2.new(0, 20, 0, 20)
CloseKeyBtn.Position = UDim2.new(1, -25, 0, 8)
CloseKeyBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
CloseKeyBtn.Text = "X"
CloseKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseKeyBtn.TextSize = 12
CloseKeyBtn.Font = Enum.Font.SourceSansBold
CloseKeyBtn.BorderSizePixel = 0
CloseKeyBtn.Parent = KeyFrame

CloseKeyBtn.MouseButton1Click:Connect(function()
    ScriptActivo = false
    ScreenGui:Destroy()
end)

-- === FUNCIÓN PRINCIPAL ULTRA RÁPIDA ===
local function IniciarScript()
    KeyFrame:Destroy()

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 320, 0, 240)
    MainFrame.Position = UDim2.new(0.5, -160, 0.4, -120)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true 
    MainFrame.Parent = ScreenGui

    local TopBorder = Instance.new("Frame")
    TopBorder.Size = UDim2.new(1, 0, 0, 4)
    TopBorder.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
    TopBorder.BorderSizePixel = 0
    TopBorder.Parent = MainFrame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -80, 0, 35)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = "SEBAS MX | TG MATCH v3.7"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.Font = Enum.Font.SourceSansBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = MainFrame

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 25, 0, 25)
    CloseBtn.Position = UDim2.new(1, -30, 0, 8)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 14
    CloseBtn.Font = Enum.Font.SourceSansBold
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Parent = MainFrame

    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Size = UDim2.new(0, 25, 0, 25)
    MinimizeBtn.Position = UDim2.new(1, -60, 0, 8)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    MinimizeBtn.Text = "_"
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.TextSize = 14
    MinimizeBtn.Font = Enum.Font.SourceSansBold
    MinimizeBtn.BorderSizePixel = 0
    MinimizeBtn.Parent = MainFrame

    local SubTitle = Instance.new("TextLabel")
    SubTitle.Size = UDim2.new(1, -20, 0, 20)
    SubTitle.Position = UDim2.new(0, 10, 0, 40)
    SubTitle.BackgroundTransparency = 1
    SubTitle.Text = "Modo Nativo: Diseñado para macros de 1ms."
    SubTitle.TextColor3 = Color3.fromRGB(160, 160, 160)
    SubTitle.TextSize = 11
    SubTitle.Font = Enum.Font.SourceSansItalic
    SubTitle.TextXAlignment = Enum.TextXAlignment.Left
    SubTitle.Parent = MainFrame

    local Line = Instance.new("Frame")
    Line.Size = UDim2.new(1, -20, 0, 1)
    Line.Position = UDim2.new(0, 10, 0, 70)
    Line.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    Line.BorderSizePixel = 0
    Line.Parent = MainFrame

    local SectionTitle = Instance.new("TextLabel")
    SectionTitle.Size = UDim2.new(1, -20, 0, 20)
    SectionTitle.Position = UDim2.new(0, 10, 0, 80)
    SectionTitle.BackgroundTransparency = 1
    SectionTitle.Text = "TRIGGERBOT EN TIEMPO REAL"
    SectionTitle.TextColor3 = Color3.fromRGB(0, 160, 255)
    SectionTitle.TextSize = 13
    SectionTitle.Font = Enum.Font.SourceSansBold
    SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    SectionTitle.Parent = MainFrame

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(1, -20, 0, 35)
    ToggleBtn.Position = UDim2.new(0, 10, 0, 110)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    ToggleBtn.Text = "TRIGGERBOT: APAGADO"
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.TextSize = 14
    ToggleBtn.Font = Enum.Font.SourceSansBold
    ToggleBtn.Parent = MainFrame

    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Size = UDim2.new(1, -20, 0, 20)
    SliderLabel.Position = UDim2.new(0, 10, 0, 160)
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.Text = "RETRASO PERSONALIZADO: 0 ms"
    SliderLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    SliderLabel.TextSize = 13
    SliderLabel.Font = Enum.Font.SourceSans
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    SliderLabel.Parent = MainFrame

    local LessDelay = Instance.new("TextButton")
    LessDelay.Size = UDim2.new(0, 40, 0, 25)
    LessDelay.Position = UDim2.new(0, 10, 0, 185)
    LessDelay.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    LessDelay.Text = "-5ms"
    LessDelay.TextColor3 = Color3.fromRGB(255, 255, 255)
    LessDelay.TextSize = 12
    LessDelay.Parent = MainFrame

    local MoreDelay = Instance.new("TextButton")
    MoreDelay.Size = UDim2.new(0, 40, 0, 25)
    MoreDelay.Position = UDim2.new(0, 55, 0, 185)
    MoreDelay.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    MoreDelay.Text = "+5ms"
    MoreDelay.TextColor3 = Color3.fromRGB(255, 255, 255)
    MoreDelay.TextSize = 12
    MoreDelay.Parent = MainFrame

    local MiniIcon = Instance.new("ImageButton")
    MiniIcon.Size = UDim2.new(0, 55, 0, 55)
    MiniIcon.Position = UDim2.new(0.1, 0, 0.2, 0)
    MiniIcon.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MiniIcon.BorderSizePixel = 0
    MiniIcon.Visible = false
    MiniIcon.Active = true
    MiniIcon.Draggable = true
    MiniIcon.Image = "rbxassetid://10612440939"
    MiniIcon.ImageColor3 = Color3.fromRGB(0, 160, 255)
    MiniIcon.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = MiniIcon

    ToggleBtn.MouseButton1Click:Connect(function()
        TriggerbotEnabled = not TriggerbotEnabled
        if TriggerbotEnabled then
            ToggleBtn.Text = "TRIGGERBOT: EN LÍNEA ✅"
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        else
            ToggleBtn.Text = "TRIGGERBOT: APAGADO"
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        end
    end)

    MinimizeBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false MiniIcon.Visible = true end)
    MiniIcon.MouseButton1Click:Connect(function() MiniIcon.Visible = false MainFrame.Visible = true end)

    CloseBtn.MouseButton1Click:Connect(function()
        ScriptActivo = false
        ScreenGui:Destroy()
    end)

    LessDelay.MouseButton1Click:Connect(function()
        local ms = math.round(TriggerDelay * 1000)
        if ms > 0 then ms = math.max(0, ms - 5) TriggerDelay = ms / 1000 SliderLabel.Text = "RETRASO PERSONALIZADO: " .. ms .. " ms" end
    end)

    MoreDelay.MouseButton1Click:Connect(function()
        local ms = math.round(TriggerDelay * 1000)
        if ms < 100 then ms = math.min(100, ms + 5) TriggerDelay = ms / 1000 SliderLabel.Text = "RETRASO PERSONALIZADO: " .. ms .. " ms" end
    end)

    local function ClickInstantaneo(Tool)
        if Tool and Tool:IsA("Tool") then
            Tool:Activate()
            -- Micro-espera biológica súper comprimida para no romper el ciclo de 1ms de la macro
            task.wait(math.random(10, 20) / 1000) 
            Tool:Deactivate()
        end
    end

    -- BUCLE NATIVO DE ALTA VELOCIDAD FIJA
    game:GetService("RunService").Stepped:Connect(function()
        if not ScriptActivo then return end
        
        if TriggerbotEnabled and not Disparando then
            local Character = LocalPlayer.Character
            local Tool = Character and Character:FindFirstChildOfClass("Tool")
            
            -- Si tienes un arma en mano, el Mouse.Target escanea el objetivo al instante
            if Tool and (tick() - UltimoDisparo) > (0.25 + (math.random(-15, 15) / 1000)) then
                local Objetivo = Mouse.Target
                
                if Objetivo then
                    -- Busca si el objeto que toca el mouse pertenece a otro jugador
                    local Rival = Players:GetPlayerFromCharacter(Objetivo.Parent) or Players:GetPlayerFromCharacter(Objetivo.Parent.Parent)
                    
                    if Rival and Rival ~= LocalPlayer then
                        if Rival.Character and Rival.Character:FindFirstChild("Humanoid") and Rival.Character.Humanoid.Health > 0 then
                            
                            UltimoDisparo = tick()
                            Disparando = true
                            
                            task.spawn(function()
                                if TriggerDelay > 0 then task.wait(TriggerDelay) end
                                
                                -- Doble validación instantánea y disparo
                                if Mouse.Target and (Players:GetPlayerFromCharacter(Mouse.Target.Parent) or Players:GetPlayerFromCharacter(Mouse.Target.Parent.Parent)) == Rival then
                                    ClickInstantaneo(Tool)
                                end
                                Disparando = false
                            end)
                        end
                    end
                end
            end
        end
    end)
end

-- Verificación de Llave
CheckBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == LLAVE_CORRECTA then
        CheckBtn.Text = "¡ACCESO COMPLETO!"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        task.wait(1)
        IniciarScript()
    else
        CheckBtn.Text = "LLAVE INCORRECTA"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        task.wait(1.5)
        CheckBtn.Text = "VERIFICAR LLAVE"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
    end
end)
