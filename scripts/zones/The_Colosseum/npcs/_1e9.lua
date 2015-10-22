-----------------------------------
-- Area: The Colosseum
-- NPC: Gate: The Pit
-----------------------------------
package.loaded["scripts/zones/The_Colosseum/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Colosseum/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------


function onTrigger(player,npc)
	player:startEvent(51);
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
	-- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
	if (csid == 51 and option == 1) then
        player:setPos(79.981, 0, -104.897, 190, 50)
    end
end;
	

