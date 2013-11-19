-----------------------------------
-- Area: Tahrongi_Canyon
-- NPC:  Dimensional_Portal
-- @pos 260.000 35.150 340.000 117
-----------------------------------
package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Tahrongi_Canyon/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:hasKeyItem(LIGHT_OF_ALTAIEU) == true) then
        player:startEvent(0x0021);
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
   if( csid == 0x0021 )then
     player:setPos(653,-1,101,158,0x21);
   end
end;