-- === CONFIGURACIÓN GLOBAL (ULTRA-LIGHT OPTIMIZADO) ===
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local TriggerbotActivo = true
local TriggerDelay = 0.030 
local UltimoDisparo = 0
local Disparando = false

-- === NOTIFICACIONES NATIVAS ===
local function EnviarNotificacion(titulo, mensaje, duracion)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = titulo,
            Text = mensaje,
            Duration = duracion or 2,
            Button1 = "OK"
        })
    end)
end

EnviarNotificacion("SEBAS MX", "Script v4.9 Cargado desde GitHub. Tecla: T", 3)

-- === DETECTOR DE TECLA T ===
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.T then
        TriggerbotActivo = not TriggerbotActivo
        if TriggerbotActivo then
            EnviarNotificacion("TRIGGERBOT", "ESTADO: ENCENDIDO ✅", 1.5)
        else
            EnviarNotificacion("TRIGGERBOT", "ESTADO: APAGADO ❌", 1.5)
        end
    end
end)

-- === EJECUCIÓN DEL CLIC ===
local function DispararFirme()
    if mouse1click then
        mouse1click()
    elseif click_click then
        click_click()
    else
        local Character = LocalPlayer.Character
        local Tool = Character and Character:FindFirstChildOfClass("Tool")
        if Tool then Tool:Activate() end
    end
end

-- === BUCLE PRINCIPAL ANTI-LAG ===
RunService.Heartbeat:Connect(function()
    if not TriggerbotActivo then return end
    
    if not Disparando then
        local Character = LocalPlayer.Character
        local Tool = Character and (Character:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool"))
        
        if Tool and (tick() - UltimoDisparo) > 0.08 then
            local Objetivo = Mouse.Target
            
            if Objetivo then
                local Rival = Players:GetPlayerFromCharacter(Objetivo.Parent) or Players:GetPlayerFromCharacter(Objetivo.Parent.Parent)
                
                if Rival and Rival ~= LocalPlayer then
                    if Rival.Character and Rival.Character:FindFirstChild("Humanoid") and Rival.Character.Humanoid.Health > 0 then
                        
                        UltimoDisparo = tick()
                        Disparando = true
                        
                        task.spawn(function()
                            task.wait(TriggerDelay)
                            
                            if Mouse.Target and (Players:GetPlayerFromCharacter(Mouse.Target.Parent) or Players:GetPlayerFromCharacter(Mouse.Target.Parent.Parent)) == Rival then
                                DispararFirme()
                            end
                            Disparando = false
                        end)
                    end
                end
            end
        end
    end
    task.wait(0.015)
end)
