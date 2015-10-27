-----------------------------------
--    Area: Quicksand Caves
--     NPC:  qm2
--  Notes: Used to spawn Tribunus VII-I
--     @pos -49.944 -0.891 -139.485 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    -- Trade Antican Tag
    if (GetMobAction(17629643) == 0 and trade:hasItemQty(1190,1) and trade:getItemCount() == 1) then
          player:tradeComplete();
        SpawnMob(17629643,900):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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