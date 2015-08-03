-----------------------------------
-- Area:  Pso'Xja
-- NPC:   _i96 (Stone Gate)
-- Notes: Red Bracelet Door
-- @pos -310.000 -1.925 -238.399 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc) 

	local Z=player:getZPos();
	
	if (Z >= -238) then
		if (player:hasKeyItem(596)==true) then -- Green Bracelet
			player:startEvent(0x003e);
		else
			player:messageSpecial(ARCH_GLOW_GREEN);	
		end	
	elseif (Z <= -239) then
		player:messageSpecial(CANNOT_OPEN_SIDE);
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

function onEventFinish(player,csid,option,npc)	
end;