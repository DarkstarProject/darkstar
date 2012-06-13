-----------------------------------
--	Area: Mhaura
--	NPC: Yabby Tanmikey
--  Guild Merchant NPC: Goldsmithing Guild 
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Mhaura/TextIDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:sendGuild(523,8,23,4)) then
		player:showText(npc,GOLDSMITHING_GUILD);
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
end;



