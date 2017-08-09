# Avatar Editor & Utility module

### Usage
Copy and paste the code from the module (since ROBLOX doesn't fully support importing Lua files) and require it from the server if using FilteringEnabled and/or with Experimental Mode disabled. This can also be used without a module, but it's recommended to use it as a module.

### Example
```Lua
-- Assuming you put the avatar module into ReplicatedStorage and named it 'avatar',
local avatar=require(game:GetService("ReplicatedStorage").avatar)

game.Players.PlayerAdded:connect(function(player)
	player.CharacterAppearanceLoaded:connect(function()
		local char=player.Character
		avatar.headscale(char, 3)
	end)
end)
```

### Module functions
_(assuming you defined the module as 'avatar')_

#### avatar.shirt(character, assetid)
Sets the Shirt of the target  **character** to the **assetid**.

#### avatar.tshirt(character, assetid)
Sets the T-Shirt of the target  **character** to the **assetid**.

#### avatar.pants(character, assetid)
Sets the Pants of the target  **character** to the **assetid**.

#### avatar.face(character, assetid)
Sets the Face of the target  **character** to the **assetid**.

#### avatar.removeshirt(character)
Removes the Shirt of the target **character**.

#### avatar.removetshirt(character)
Removes the T-Shirt of the target **character**.

#### avatar.removepants(character)
Removes the Pants of the target **character**.

#### avatar.removeface(character)
Removes the Face of the target **character**.

#### avatar.addaccessory(character, assetid)
Adds an Accessory to the target **character** from **assetid**.

#### avatar.delaccessory(character, name)
Deletes an Accessory from the target  **character** using **name**.

#### avatar.clraccessories(character)
Clears all Accessories on the target **character**.

#### avatar.getaccessories(character)
Returns a table of all accessories on the target **character**.

#### avatar.widthscale(character, scale)
Changes the width scale of a target R15 **character** to **scale**.

#### avatar.heightscale(character, scale)
Changes the height scale of a target R15 **character** to **scale**.

#### avatar.depthscale(character, scale)
Changes the depth scale of a target R15 **character** to **scale**.

#### avatar.headscale(character, scale)
Changes the head scale of a target R15 **character** to **scale**.
