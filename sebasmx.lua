-- === CONFIGURACIÓN GLOBAL (ULTRA-LIGHT) ===
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")

local TriggerDelay = 0.030 -- 30ms estables para sincronizar con tu TGMacro
local UltimoDisparo = 0
local Disparando = false

print("¡SEBAS MX - TRIGGERBOT INVISIBLE CARGADO CON ÉXITO!")

-- === EJECUCIÓN DIRECTA DEL CLIC ===
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

-- === BUCLE PRINCIPAL (RENDERSTEPPED) ===
RunService.RenderStepped:Connect(function()
    if not Disparando then
        local Character = LocalPlayer.Character
        -- Detecta el arma incluso si tu macro de slot la mueve rápido
        local Tool = Character and (Character:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool"))
        
        if Tool and (tick() - UltimoDisparo) > 0.08 then
            local Objetivo = Mouse.Target
            
            if Objetivo then
                -- Verifica si estás apuntando a un enemigo
                local Rival = Players:GetPlayerFromCharacter(Objetivo.Parent) or Players:GetPlayerFromCharacter(Objetivo.Parent.Parent)
                
                if Rival and Rival ~= LocalPlayer then
                    if Rival.Character and Rival.Character:FindFirstChild("Humanoid") and Rival.Character.Humanoid.Health > 0 then
                        
                        UltimoDisparo = tick()
                        Disparando = true
                        
                        task.spawn(function()
                            task.wait(TriggerDelay)
                            
                            -- Doble comprobación de mira antes de soltar el tiro
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
end)
