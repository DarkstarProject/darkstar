-----------------------------------
-- Area: Phomiuna_Aqueducts
-- NPC:  _ir7 (Iron Gate)
-- @pos -70.800 -1.500 60.000 27
-----------------------------------
package.loaded["scripts/zones/Phomiuna_Aqueducts/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Phomiuna_Aqueducts/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getXPos() >= -70 and npc:getAnimation() == 9) then -- only if they're on the locked side and gate is closed.
        if (trade:hasItemQty(1660,1) and trade:getItemCount() == 1) then -- Bronze Key
            player:tradeComplete();
            npc:openDoor(15);
        elseif ((trade:hasItemQty(1115,1) or trade:hasItemQty(1023,1) or trade:hasItemQty(1022,1)) and trade:getItemCount() == 1 and player:getMainJob() == 6) then
            -- thief's tool/living key/skeleton key as THF main
            player:tradeComplete();
            npc:openDoor(15);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   
    if (player:getXPos() <= -71) then
        npc:openDoor(15); -- Retail timed
    elseif (npc:getAnimation() == 9) then -- don't want it to say the door is locked when it's wide open!
        player:messageSpecial(DOOR_LOCKED,1660);
    end
    return 1;
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