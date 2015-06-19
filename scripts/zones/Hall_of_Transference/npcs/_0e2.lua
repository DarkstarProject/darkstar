-----------------------------------
-- Area: Hall of Transference
-- NPC:  Cermet Gate - Mea
-- @pos 280 -86 -19
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Hall_of_Transference/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if(player:getCurrentMission(COP) > BELOW_THE_ARKS)then
        player:startEvent(0x0096);
    else
        player:messageSpecial(NO_RESPONSE_OFFSET+1); -- The door is firmly shut.
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
    if(csid == 0x0096 and option == 1) then
        player:setPos(-93.268, 0, 170.749, 162, 20); -- To Promyvion Mea {R}
    end
end;