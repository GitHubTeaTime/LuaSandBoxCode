local Bazooka = Instance.new("Tool", owner.Backpack)
Bazooka.Grip = CFrame.new(0,-1,0)
Bazooka.Name = "Bazooka"
 
local handle = Instance.new("Part", Bazooka)
handle.Name = "Handle"
handle.Size = Vector3.new(1,1,5)
handle.Color = Color3.fromRGB(0,120,0)
handle.Material = Enum.Material.DiamondPlate
handle.Transparency = 0
 
local ddb = false
local sdb = false
 
Bazooka.Activated:Connect(function()
    if sdb == false then
        sdb = true
        local bullet = Instance.new("Part", workspace)
        bullet.Size = Vector3.new(0.5,0.5,1.5)
        bullet.Color = Color3.fromRGB(0,150,0)
        bullet.Material = Enum.Material.DiamondPlate
        bullet.CFrame = handle.CFrame
        bullet.CanCollide = true
        local force = Instance.new("BodyVelocity", bullet)
        force.MaxForce = Vector3.one * math.huge
        force.P = Vector3.one * 9999
        force.Velocity = Vector3.new(bullet.CFrame.lookVector.X*325,bullet.CFrame.lookVector.Y*-7.5,bullet.CFrame.lookVector.Z*325)
        local fire = Instance.new("Fire")
        fire.Parent = bullet
        bullet.Touched:Connect(function(hit)
            local h = hit.Parent:FindFirstChild("Humanoid")
            if h and ddb == false and h.Parent.Name ~= owner.Character.Name and h.Health ~= 0 then
                ddb = true
                local e = Instance.new("Explosion")
                e.Parent = workspace
                e.BlastRadius = 12.5
                e.Position = bullet.Position
                bullet:Destroy()
                wait(0.45)
                ddb = false
            end
            wait(5)
            bullet:Destroy()
        end)
        wait(2.35)
        sdb = false
    end
end)
