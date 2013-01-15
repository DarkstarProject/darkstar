-----------------------------------
--	[Command name]: additem
--	[Author      ]: 
--	[Description ]: 
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,itemID,quantity)
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs); 
    
	if (player:getFreeSlotsCount() == 0) then 
		player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,itemID);
	else 
		player:addItem(itemID,quantity);
		player:messageSpecial(ITEM_OBTAINED,itemID);
	end
end;