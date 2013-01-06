-----------------------------------
-- Area: Bastok Mines
-- NPC:  Conrad
-- Outpost Teleporter NPC
-- @pos 94.457 -0.375 -66.161 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/conquest");
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
	
	loca = option - 1073741824;
	player:updateEvent(player:getGil(),OP_TeleFee(player,loca),player:getCP(),OP_TeleFee(player,loca));
	
end;

-----------------------------------
--onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if(option >= 5 and option <= 23) then
		if (player:delGil(OP_TeleFee(player,option))) then
            toOutpost(player,option);
        end
	end
	
end;