-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  ??? (Spawn Olla Pequena)
-- @pos 851 0.1 92 178
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (GetMobAction(17506667) == 0 and GetMobAction(17506668) == 0 and GetMobAction(17506669) == 0 and 
    trade:hasItemQty(1195,1) and trade:getItemCount() == 1) then -- Trade Ro'Maeve Water
        player:tradeComplete();
        SpawnMob(17506667,180):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(SMALL_HOLE_HERE);
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