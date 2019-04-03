-----------------------------------------
-- ID: 26517
-- Item: Shadow Lord Shirt
-- Teleports user to Castle Zvahl Keep
-----------------------------------------

function onItemUse(target)
	-- Teleports user to Castle Zvahl Keep
	-- May need a retail capture to verify
	-- https://ffxiclopedia.fandom.com/wiki/Shadow_Lord_Shirt states teleports next to HP#1
	-- so I copied the homepoint teleport position
	target:setPos(-554, -70, 66, 0, 162)
end
