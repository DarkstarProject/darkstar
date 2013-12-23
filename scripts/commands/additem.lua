-----------------------------------
--	[Command name]: additem
--	[Author      ]: 
--	[Description ]: 
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,itemID,quantity,aug0,aug0val,aug1,aug1val,aug2,aug2val,aug3,aug3val)
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs); 
    
	if (itemID == nil) then
		player:PrintToPlayer('You must enter an itemID.');
		return;
	end
	

	if (player:getFreeSlotsCount() == 0) then 
		player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,itemID);
	else 
		player:addItem(itemID,quantity,aug0,aug0val,aug1,aug1val,aug2,aug2val,aug3,aug3val);
		player:messageSpecial(ITEM_OBTAINED,itemID);
	end
end;