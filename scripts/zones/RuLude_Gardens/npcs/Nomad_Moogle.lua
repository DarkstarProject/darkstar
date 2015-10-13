-----------------------------------
--  Area: Ru'Lude Gardens
--  NPC:  Nomad Moogle
--  Type: Adventurer's Assistant
--  @pos 10.012 1.453 121.883 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:hasKeyItem(LIMIT_BREAKER) == false and player:getMainLvl() >= 75) then
		player:startEvent(0x273D,0x4B,0x02,0x0A,0x07,0x1E,0x049F2F,0x0FFF);
	else
		player:startEvent(0x005E);
	end

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
	
	if (csid == 0x273D and option ~= -1) then
		player:addKeyItem(LIMIT_BREAKER);
		player:messageSpecial(KEYITEM_OBTAINED,LIMIT_BREAKER);
	end
	
end;