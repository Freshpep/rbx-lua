-- // Avatar Editor & Utility Module
-- // Author: Smeers
-- // 8/9/2017

-- [Note] There's a few ways to make this more efficient, but I chose not to in some places for usability purposes.


-- / Helper stuff
local function getHumanoid(character)
	if character:FindFirstChild("Humanoid") then
		return true,character:FindFirstChild("Humanoid")
	else
		return false
	end
end
local function insertAsset(id)
	local is=game:GetService("InsertService")
	local item
	local success, err = pcall(function()
		item=is:LoadAsset(id)
	end)
	if success then
		return true,item:GetChildren()[1]
	end
	return false,nil
end
local rbxai="rbxassetid://"
local avatar={}


-- / Module functions
function avatar.shirt(character,asset)
	local success, item=insertAsset(tostring(asset))
	if success then
		if character:FindFirstChild("Shirt") then
			character:FindFirstChild("Shirt"):Destroy()
		end
	item.Parent=character
	end
end

function avatar.tshirt(character,asset)
	local success, item=insertAsset(tostring(asset))
	if success then
		if character:FindFirstChild("Shirt Graphic") then
			character:FindFirstChild("Shirt Graphic"):Destroy()
		end
	item.Parent=character
	end
end

function avatar.pants(character,asset)
	local success, item=insertAsset(tostring(asset))
	if success then
		if character:FindFirstChild("Pants") then
			character:FindFirstChild("Pants"):Destroy()
		end
	item.Parent=character
	end
end

function avatar.face(character,asset)
	local success, item=insertAsset(tostring(asset))
	if success then
		if character.Head:FindFirstChild("face") then
			character.Head:FindFirstChild("face"):Destroy()
		end
	item.Parent=character.Head
	end
end

function avatar.removeshirt(character)
	if character:FindFirstChild("Shirt") then
		character["Shirt"]:Destroy()	
	end
end

function avatar.removetshirt(character)
	if character:FindFirstChild("Shirt Graphic") then
		character["Shirt Graphic"]:Destroy()	
	end
end

function avatar.removepants(character)
	if character:FindFirstChild("Pants") then
		character["Pants"]:Destroy()	
	end
end

function avatar.removeface(character)
	if character.Head:FindFirstChild("face") then
		character.Head["face"]:Destroy()	
	end
end

function avatar.addaccessory(character,asset)
	local success,humanoid=getHumanoid(character)
	local success0,item=insertAsset(asset)
	if success and success0 then
		if item~=nil then
			humanoid:AddAccessory(item)
		end
	else
		if item~=nil then
			if item.Parent~=nil then item.Parent:Destroy() else item:Destroy() end
		end
	end
end

function avatar.delaccessory(character,name)
	if character:FindFirstChild(name) then
		local object=character:FindFirstChild(name)
		if object:IsA("Accessory") then
			object:Destroy()
		end
	end
end

function avatar.clraccessories(character)
	local success,humanoid=getHumanoid(character)
	if success then
		humanoid:RemoveAccessories()
	end
end

function avatar.getaccessories(character)
	local accessories={}
	for i,v in ipairs(character:GetChildren()) do
		if v:IsA("Accessory") then
			table.insert(accessories,v)
		end
	end
	return accessories
end

function avatar.widthscale(character,num)
	local success,humanoid=getHumanoid(character)
	if success then
		if humanoid.RigType==Enum.HumanoidRigType.R15 then
			humanoid.BodyWidthScale.Value=num
		end
	end
end

function avatar.heightscale(character,num)
	local success,humanoid=getHumanoid(character)
	if success then
		if humanoid.RigType==Enum.HumanoidRigType.R15 then
			humanoid.BodyHeightScale.Value=num
		end
	end
end

function avatar.depthscale(character,num)
	local success,humanoid=getHumanoid(character)
	if success then
		if humanoid.RigType==Enum.HumanoidRigType.R15 then
			humanoid.BodyDepthScale.Value=num
		end
	end
end

function avatar.headscale(character,num)
	local success,humanoid=getHumanoid(character)
	if success then
		if humanoid.RigType==Enum.HumanoidRigType.R15 then
			humanoid.HeadScale.Value=num
		end
	end
end


-- / Return module
return avatar
