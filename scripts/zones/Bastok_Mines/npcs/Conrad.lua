-----------------------------------
-- Area: Bastok Mines
-- NPC:  Conrad
-- Outpost Teleporter NPC
-- @zone 234
-- @pos 94.457 -0.375 -66.161
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/conquestguards");
require("scripts/zones/Bastok_Mines/TextIDs");

guardnation = BASTOK;
csid 		= 0x0245;

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
		player:startEvent(csid,0,0,0,0,0,0,player:getMainLvl(),1073741823 - player:getVar("supplyQuest_BASTOK"));
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
	
	loca = option - 1073741824;
	player:updateEvent(player:getGil(),OP_TeleFee(player,loca),getCP(player),OP_TeleFee(player,loca));
	
end;

-----------------------------------
--onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(option >= 5 and option <= 23) then
		player:delGil(OP_TeleFee(player,option));
		toOutpost(player,option);
	end
	
end;