-----------------------------------
--	[Command name]: pardon
--	[Author      ]: Loraunt
--	[Description ]: Pardons a player from Mordion Gaol
-----------------------------------

-----------------------------------
-- Action
-----------------------------------
ZONE_MORDION_GAOL = 131

function onTrigger(gm, target)
	--printf("@pardon by %d", player:getID());
	--printf("Parameters: %s", target);
	
	pc = GetPlayerByName(target);
	
	if(pc ~= nil) then
		local pardon_message = string.format("%d pardoning %d(%s)", gm:getID(), pc:getID(), target);
		printf(pardon_message);

		pc:setVar("inJail", 0);
		pc:warp();
	else
		--printf("Player named %s not found!",target);
	end
end;

-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
--print("CS : onEventUpdate");
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--print("CS : onEventFinish");
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;
