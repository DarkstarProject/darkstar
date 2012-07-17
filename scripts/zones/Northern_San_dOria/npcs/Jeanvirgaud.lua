-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Jeanvirgaud
-- Outpost Teleporter NPC
-- @zone 231
-- @pos 45.559 -0.199 26.300
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-----------------------------------

require("scripts/globals/conquestguards");
require("scripts/zones/Northern_San_dOria/TextIDs");

guardnation = SANDORIA;
csid 		= 0x02cc;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(guardnation == player:getNation()) then
		player:startEvent(csid,0,0,0,0,0,0,player:getMainLvl(),1073741823 - player:getNationTeleport(guardnation));
	else
		player:startEvent(csid,0,0,0,0,0,1,0,0);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	loca = option - 1073741829;
	player:updateEvent(player:getGil(),OP_TeleFee(player,loca),player:getCP(),OP_TeleFee(player,loca));
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(option >= 5 and option <= 23) then
		player:delGil(OP_TeleFee(player,option));
		toOutpost(player,option);
	end
	
end;