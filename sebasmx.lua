-- === CONFIGURACIÓN DE LA LLAVE (CÁMBIALA CUANDO QUIERAS) ===
local LLAVE_CORRECTA = "SEBAS_MX_VIP" -- <- Esta es tu contraseña. Puedes cambiarla por la que tú quieras.

-- === SERVICIOS ===
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- === CONFIGURACIÓN JUEGO ===
local TriggerbotEnabled = false
local TriggerDelay = 0.05
local UltimoDisparo = 0
local Disparando = false 

-- === INTERFAZ DEL SISTEMA DE LLAVES (KEY SYSTEM) ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SebasMX_KeySystem"
ScreenGui.ResetOnSpawn = false

pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Ventana de la Llave
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 300, 0, 160)
KeyFrame.Position = UDim2.new(0.5, -150, 0.4, -80)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = ScreenGui

-- Borde Azul Superior
local KeyBorder = Instance.new("Frame")
KeyBorder.Size = UDim2.new(1, 0, 0, 4)
KeyBorder.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
KeyBorder.BorderSizePixel = 0
KeyBorder.Parent = KeyFrame

-- Título
local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 30)
KeyTitle.Position = UDim2.new(0, 0, 0, 10)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "SEBAS MX | SISTEMA DE LLAVES"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 14
KeyTitle.Font = Enum.Font.SourceSansBold
KeyTitle.Parent = KeyFrame

-- Cuadro de texto para escribir la llave
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

-- Botón para verificar
local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(1, -40, 0, 35)
CheckBtn.Position = UDim2.new(0, 20, 0, 105)
CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
CheckBtn.Text = "VERIFICAR LLAVE"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.TextSize = 14
CheckBtn.Font = Enum.Font.SourceSansBold
CheckBtn.Parent = KeyFrame


-- === FUNCIÓN PRINCIPAL DEL SCRIPT (SE ABRE SOLO SI LA KEY ES CORRECTA) ===
local function IniciarScript()
    KeyFrame:Destroy() -- Borra la ventana de la llave de la pantalla

    -- Contenedor Principal (Ventana Oscura)
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 320, 0, 240)
    MainFrame.Position = UDim2.new(0.5, -160, 0.4, -120)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true 
    MainFrame.Visible = true
    MainFrame.Parent = ScreenGui

    -- Borde Estético Azul
    local TopBorder = Instance.new("Frame")
    TopBorder.Size = UDim2.new(1, 0, 0, 4)
    TopBorder.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
    TopBorder.BorderSizePixel = 0
    TopBorder.Parent = MainFrame

    -- Título del Menú
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -50, 0, 35)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = "SCRIPT SEBAS MX | SAFE DUELS v3.1"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.Font = Enum.Font.SourceSansBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = MainFrame

    -- Botón para Minimizar En la Ventana Grande
    local MinimizeBtn = Instance.new("TextButton")
    MinimizeBtn.Size = UDim2.new(0, 30, 0, 25)
    MinimizeBtn.Position = UDim2.new(1, -35, 0, 8)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
    MinimizeBtn.Text = "_"
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.TextSize = 16
    MinimizeBtn.Font = Enum.Font.SourceSansBold
    MinimizeBtn.BorderSizePixel = 0
    MinimizeBtn.Parent = MainFrame

    -- Subtítulo explicativo
    local SubTitle = Instance.new("TextLabel")
    SubTitle.Size = UDim2.new(1, -20, 0, 20)
    SubTitle.Position = UDim2.new(0, 10, 0, 40)
    SubTitle.BackgroundTransparency = 1
    SubTitle.Text = "Versión optimizada invisible para sistemas Anti-Cheat."
    SubTitle.TextColor3 = Color3.fromRGB(160, 160, 160)
    SubTitle.TextSize = 12
    SubTitle.Font = Enum.Font.SourceSansItalic
    SubTitle.TextXAlignment = Enum.TextXAlignment.Left
    SubTitle.Parent = MainFrame

    -- Separador
    local Line = Instance.new("Frame")
    Line.Size = UDim2.new(1, -20, 0, 1)
    Line.Position = UDim2.new(0, 10, 0, 70)
    Line.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    Line.BorderSizePixel = 0
    Line.Parent = MainFrame

    -- Etiqueta Sección Triggerbot
    local SectionTitle = Instance.new("TextLabel")
    SectionTitle.Size = UDim2.new(1, -20, 0, 20)
    SectionTitle.Position = UDim2.new(0, 10, 0, 80)
    SectionTitle.BackgroundTransparency = 1
    SectionTitle.Text = "TRIGGERBOT BY SEBAS MX"
    SectionTitle.TextColor3 = Color3.fromRGB(0, 160, 255)
    SectionTitle.TextSize = 13
    SectionTitle.Font = Enum.Font.SourceSansBold
    SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    SectionTitle.Parent = MainFrame

    -- Botón: ENABLED (Activar/Desactivar)
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(1, -20, 0, 35)
    ToggleBtn.Position = UDim2.new(0, 10, 0, 110)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    ToggleBtn.Text = "TRIGGERBOT: DESACTIVADO"
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.TextSize = 14
    ToggleBtn.Font = Enum.Font.SourceSansBold
    ToggleBtn.Parent = MainFrame

    -- Etiqueta del Slider de Delay
    local SliderLabel = Instance.new("TextLabel")
    SliderLabel.Size = UDim2.new(1, -20, 0, 20)
    SliderLabel.Position = UDim2.new(0, 10, 0, 160)
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.Text = "DELAY: 50 ms (Retraso antes de disparar)"
    SliderLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    SliderLabel.TextSize = 13
    SliderLabel.Font = Enum.Font.SourceSans
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    SliderLabel.Parent = MainFrame

    -- Botones rápidos para ajustar el Delay (+ / -)
    local LessDelay = Instance.new("TextButton")
    LessDelay.Size = UDim2.new(0, 40, 0, 25)
    LessDelay.Position = UDim2.new(0, 10, 0, 185)
    LessDelay.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    LessDelay.Text = "-10ms"
    LessDelay.TextColor3 = Color3.fromRGB(255, 255, 255)
    LessDelay.TextSize = 12
    LessDelay.Parent = MainFrame

    local MoreDelay = Instance.new("TextButton")
    MoreDelay.Size = UDim2.new(0, 40, 0, 25)
    MoreDelay.Position = UDim2.new(0, 55, 0, 185)
    MoreDelay.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    MoreDelay.Text = "+10ms"
    MoreDelay.TextColor3 = Color3.fromRGB(255, 255, 255)
    MoreDelay.TextSize = 12
    MoreDelay.Parent = MainFrame

    -- === CREACIÓN DEL BOTÓN FLOTANTE MINI (CÍRCULO CON PISTOLA) ===
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

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(0, 160, 255)
    UIStroke.Thickness = 2
    UIStroke.Parent = MiniIcon

    local MiniTag = Instance.new("TextLabel")
    MiniTag.Size = UDim2.new(1, 0, 0, 15)
    MiniTag.Position = UDim2.new(0, 0, 1, -12)
    MiniTag.BackgroundTransparency = 1
    MiniTag.Text = "S_MX"
    MiniTag.TextColor3 = Color3.fromRGB(255, 255, 255)
    MiniTag.TextSize = 10
    MiniTag.Font = Enum.Font.SourceSansBold
    MiniTag.Parent = MiniIcon

    -- Lógica Minimizar
    MinimizeBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
        MiniIcon.Visible = true
    end)

    MiniIcon.MouseButton1Click:Connect(function()
        MiniIcon.Visible = false
        MainFrame.Visible = true
        MainFrame.Position = UDim2.new(MiniIcon.Position.X.Scale, MiniIcon.Position.X.Offset, MiniIcon.Position.Y.Scale, MiniIcon.Position.Y.Offset)
    end)

    -- Interacciones
    ToggleBtn.MouseButton1Click:Connect(function()
        TriggerbotEnabled = not TriggerbotEnabled
        if TriggerbotEnabled then
            ToggleBtn.Text = "TRIGGERBOT: ACTIVADO"
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        else
            ToggleBtn.Text = "TRIGGERBOT: DESACTIVADO"
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        end
    end)

    LessDelay.MouseButton1Click:Connect(function()
        local ms = math.round(TriggerDelay * 1000)
        if ms > 0 then
            ms = math.max(0, ms - 10)
            TriggerDelay = ms / 1000
            SliderLabel.Text = "DELAY: " .. ms .. " ms (Retraso antes de disparar)"
        end
    end)

    MoreDelay.MouseButton1Click:Connect(function()
        local ms = math.round(TriggerDelay * 1000)
        if ms < 300 then
            ms = math.min(300, ms + 10)
            TriggerDelay = ms / 1000
            SliderLabel.Text = "DELAY: " .. ms .. " ms (Retraso antes de disparar)"
        end
    end)

    local function DispararArma(Tool)
        if Tool and Tool:IsA("Tool") then
            Tool:Activate()
            task.wait(math.random(15, 35) / 1000) 
            Tool:Deactivate()
        end
    end

    -- Bucle Triggerbot
    task.spawn(function()
        while true do
            task.wait(0.02)
            if TriggerbotEnabled and not Disparando then
                local Character = LocalPlayer.Character
                local Tool = Character and Character:FindFirstChildOfClass("Tool")
                if Tool and (tick() - UltimoDisparo) > (0.4 + (math.random(-50, 50) / 1000)) then
                    local MousePos = UserInputService:GetMouseLocation()
                    local RayoMouse = Camera:ViewportPointToRay(MousePos.X, MousePos.Y)
                    local Parametros = RaycastParams.new()
                    Parametros.FilterType = Enum.RaycastFilterType.Exclude
                    Parametros.FilterDescendantsInstances = {Character}
                    local Resultado = workspace:Raycast(RayoMouse.Origin, RayoMouse.Direction * 1000, Parametros)
                    if Resultado and Resultado.Instance then
                        local ParteTocada = Resultado.Instance
                        local Rival = Players:GetPlayerFromCharacter(ParteTocada.Parent) or Players:GetPlayerFromCharacter(ParteTocada.Parent.Parent)
                        if Rival and Rival ~= LocalPlayer then
                            if Rival.Character and Rival.Character:FindFirstChild("Humanoid") and Rival.Character.Humanoid.Health > 0 then
                                UltimoDisparo = tick()
                                Disparando = true
                                task.spawn(function()
                                    local HumanDelay = TriggerDelay + (math.random(-5, 5) / 1000)
                                    if HumanDelay > 0 then task.wait(HumanDelay) end
                                    local ReCheck = workspace:Raycast(RayoMouse.Origin, RayoMouse.Direction * 1000, Parametros)
                                    if ReCheck and ReCheck.Instance then
                                        local Validar = Players:GetPlayerFromCharacter(ReCheck.Instance.Parent) or Players:GetPlayerFromCharacter(ReCheck.Instance.Parent.Parent)
                                        if Validar == Rival then DispararArma(Tool) end
                                    end
                                    Disparando = false
                                end)
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- === LÓGICA DE VERIFICACIÓN DE LA LLAVE ===
CheckBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == LLAVE_CORRECTA then
        CheckBtn.Text = "¡LLAVE CORRECTA!"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        task.wait(1)
        IniciarScript() -- Llama al Triggerbot original
    else
        CheckBtn.Text = "LLAVE INCORRECTA"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        task.wait(1.5)
        CheckBtn.Text = "VERIFICAR LLAVE"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
    end
end)
