-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Daggao
-- Involved in Quest: Peace for the Spirit
-- @zone 230
-- @pos 89 0 119
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getVar("peaceForTheSpiritCS") == 3) then
		player:startEvent(0x0048);
	elseif(player:getVar("peaceForTheSpiritCS") == 5) then
		player:startEvent(0x0049);
	else
		player:startEvent(0x003c);
	end
	
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if(csid == 0x0048) then
		player:setVar("peaceForTheSpiritCS",4);
	end

end;

---- used for future expansion
--	player:startEvent(0x032a)--red badge