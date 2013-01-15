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
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs); 

	player:addKeyItem(keyID);
	player:messageSpecial(KEYITEM_OBTAINED,keyID);
end;