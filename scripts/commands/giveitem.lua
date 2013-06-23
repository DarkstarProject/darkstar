-----------------------------------
--	[Command name]: give item to player
--	[Author      ]: link
--	[Description ]: will give item to player
--
--	(@giveitem Link 17440) will give link 1 kraken club
--	(@giveitem Link 1179 99) will give link 99x shihei
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,itemID,quantity)

	local pc = GetPlayerByName(target);
    
    if (pc ~= nil) then
        local TextIDs = "scripts/zones/" .. pc:getZoneName() .. "/TextIDs";
        package.loaded[TextIDs] = nil;
        require(TextIDs);

        if (pc:getFreeSlotsCount() == 0) then 
            pc:messageSpecial(ITEM_CANNOT_BE_OBTAINED,itemID);
        else 
            pc:addItem(itemID,quantity);
            pc:messageSpecial(ITEM_OBTAINED,itemID);
        end
    end
end;