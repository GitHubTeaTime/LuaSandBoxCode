local Binoc = Instance.new("Tool", owner.Backpack)
Binoc.Grip = CFrame.new(1.5,-1.15,-0.55)
Binoc.Name = "Binoculars"
 
local BinocHandle = Instance.new("Part", Binoc)
BinocHandle.Size = Vector3.new(1,0.35,1)
BinocHandle.Color = Color3.fromRGB(25,25,25)
BinocHandle.Name = "Handle"
 
NLS([[
 
local UIS = game:GetService("UserInputService")
local Binoc = owner.Backpack:WaitForChild("Binoculars")
local NormalSens = UIS.MouseDeltaSensitivity
local BinocFOV = 30
local BinocSens = 10
local ZoomedBinocFOV = 10
local ZoomedBinocSens = 50
 
Binoc.Equipped:Connect(function()
    Binoc.Handle.Transparency = 1
    workspace.CurrentCamera.FieldOfView = BinocFOV
    UIS.MouseDeltaSensitivity = NormalSens / BinocSens
end)
 
Binoc.Activated:Connect(function()
    Binoc.Handle.Transparency = 1
    workspace.CurrentCamera.FieldOfView = ZoomedBinocFOV
    UIS.MouseDeltaSensitivity = NormalSens / ZoomedBinocSens
end)
 
Binoc.Unequipped:Connect(function()
    Binoc.Handle.Transparency = 0
    workspace.CurrentCamera.FieldOfView = 70
    UIS.MouseDeltaSensitivity = NormalSens
end)
 
]]
 
, owner.Character.Head)
