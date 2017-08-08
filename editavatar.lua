local avatar={}

-- Helper functions
local function getHumanoid(character)
	if character:FindFirstChild("Humanoid") then -- Waiting for FindFirstChildOfClass to come out. Why use a for iterator?
		return true,character:FindFirstChild("Humanoid")
	else
		return false -- Just for debugging
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
-- Vars for ease
local rbxai="rbxassetid://"

function avatar.shirt(character,asset)
	if character:FindFirstChild("Shirt") then
		local shirt=character:FindFirstChild("Shirt")
		shirt.ShirtTemplate=rbxai..tostring(asset)
	else
		local shirt=Instance.new("Shirt",character)
		shirt.Name="Shirt" -- Can't trust ROBLOX's default names nowadays with the api changing constantly lol
		shirt.ShirtTemplate=rbxai..tostring(asset)
	end
end

function avatar.tshirt(character,asset)
	if character:FindFirstChild("Shirt Graphic") then
		local graphic=character:FindFirstChild("Shirt Graphic")
		graphic.Graphic=rbxai..tostring(asset)
	else
		local graphic=Instance.new("ShirtGraphic",character)
		graphic.Name="Shirt Graphic"
		graphic.Graphic=rbxai..tostring(asset)
	end
end

function avatar.pants(character,asset)
	if character:FindFirstChild("Pants") then
		local pants=character:FindFirstChild("Pants")
		pants.PantsTemplate=rbxai..tostring(asset)
	else
		local pants=Instance.new("Pants",character)
		pants.Name="Pants"
		pants.PantsTemplate=rbxai..tostring(asset)
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
	-- i mean you can't really make it any better than this...
	if character:FindFirstChild(name) then
		local object=character:FindFirstChild(name)
		if object:IsA("Accessory") then
			object:Destroy()
		end
	end
end

function avatar.clearaccessory(character)
	local success,humanoid=getHumanoid(character)
	if success then
		humanoid:RemoveAccessories()
	end
end

function avatar.getaccessories(character)
	local accessories={}
	for i,v in ipairs(character) do
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

return avatar
