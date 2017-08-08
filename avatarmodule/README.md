# Avatar Editor & Utility module
### Created by Smeers

#### Usage
Copy and paste the code from the module (since ROBLOX doesn't fully support importing Lua files) and require it from the server if using FilteringEnabled and/or with Experimental Mode disabled. This can also be used without a module, but it's recommended to use it as a module.

#### Module functions
_(assuming you defined the module as 'avatar')_

##### avatar.shirt(character, assetid)
Sets the Shirt of the target  **character** to the **assetid**.

##### avatar.tshirt(character, assetid)
Sets the T-Shirt of the target  **character** to the **assetid**.

##### avatar.pants(character, assetid)
Sets the Pants of the target  **character** to the **assetid**.

##### avatar.addaccessory(character, assetid)
Adds an accessory to the target **character** from **assetid**.

##### avatar.delaccessory(character, name)
Deletes an accessory from the target  **character** using **name**.

##### avatar.clraccessories(character)
Clears all accessories on the target **character**.

##### avatar.getaccessories(character)
Returns a table of all accessories on the target **character**.

##### avatar.widthscale(character, scale)
Changes the width scale of a target R15 **character** to **scale**.

##### avatar.heightscale(character, scale)
Changes the height scale of a target R15 **character** to **scale**.

##### avatar.depthscale(character, scale)
Changes the depth scale of a target R15 **character** to **scale**.

##### avatar.headscale(character, scale)
Changes the head scale of a target R15 **character** to **scale**.

