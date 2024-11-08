-- [[Coloque este script em um LocalScript no personagem de um jogador]]
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
 
local isDashing = false
local dashCooldown = 7
local lastDashTime = 0
 
local function onKeyPress(input)
    if input.KeyCode == Enum.KeyCode.Space and humanoid:GetState() == Enum.HumanoidStateType.Seated then
        -- [[Não corra se o personagem estiver sentado (por exemplo, quando ele estiver em um carro)]]
        return
    end
 
    if input.KeyCode == Enum.KeyCode.LeftShift and not isDashing and (tick() - lastDashTime) > dashCooldown then
        isDashing = true
        lastDashTime = tick()
 
        -- [[Personalize o comportamento do dash com base nos requisitos do jogo]]
        local dashSpeed = 130
        local dashDuration = 0.2
 
        local originalWalkSpeed = humanoid.WalkSpeed
        humanoid.WalkSpeed = dashSpeed
 
        wait(dashDuration)
 
        humanoid.WalkSpeed = originalWalkSpeed
        isDashing = false
    end
end
 
-- [[Conecte a função ao evento de pressionamento de tecla]]
game:GetService("UserInputService").InputBegan:Connect(onKeyPres.Q)