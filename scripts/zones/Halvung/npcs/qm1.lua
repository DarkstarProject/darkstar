-----------------------------------
-- Area: Halvung
-- NPC:  ??? (Spawn Big Bomb)
-- @pos -233.830 13.613 286.714 62
-----------------------------------
package.loaded["scripts/zones/Halvung/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Halvung/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    -- Trade Smokey Flask
    if (GetMobAction(17031401) == 0 and trade:hasItemQty(2384,1) and trade:getItemCount() == 1) then 
        player:tradeComplete();
        SpawnMob(17031401,900):updateClaim(player); -- Big Bomb
        npc:setStatus(STATUS_DISAPPEAR);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(BLUE_FLAMES);
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