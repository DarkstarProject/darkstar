-----------------------------------
-- Area: Qulun Dome
-- NPC:  Door
-- Involved in Mission: Limit Break 3
-- @pos 300 40 45 147
-----------------------------------
package.loaded["scripts/zones/Qulun_Dome/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Qulun_Dome/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:hasKeyItem(SILVER_BELL) and player:hasKeyItem(CORUSCANT_ROSARY) and player:hasKeyItem(BLACK_MATINEE_NECKLACE)) then
		if(player:getZPos() < 46) then
			player:messageSpecial(THE_3_ITEMS_GLOW_FAINTLY,SILVER_BELL,CORUSCANT_ROSARY,BLACK_MATINEE_NECKLACE);
			GetNPCByID(17383468):openDoor();
		else
			player:messageSpecial(CANNOT_BE_OPENED_FROM_THIS_SIDE);
		end
	else
		player:messageSpecial(IT_SEEMS_TO_BE_LOCKED_BY_POWERFUL_MAGIC);
	end
	
	return 1;
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);	
end;