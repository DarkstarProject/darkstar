-----------------------------------
--	[Command name]: addkeyitem
--	[Author      ]: 
--	[Description ]: 
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,keyID)

	player:addKeyItem(keyID);
	player:messageSpecial(KEYITEM_OBTAINED,keyID);
end;