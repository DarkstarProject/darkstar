-----------------------------------
-- Area: Riverne Site #B01
--  NPC: Unstable Displacement
-----------------------------------

require("scripts/globals/settings");
local text = require("scripts/zones/Riverne-Site_B01/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    
    if (GetMobAction(16896155) == 0 and trade:hasItemQty(1880,1) and trade:getItemCount() == 1) then -- Trade Clustered tar
        player:tradeComplete();
        SpawnMob(16896155):updateClaim(player); -- Unstable Cluster
        npc:setStatus(STATUS_DISAPPEAR);
    end    
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(text.GROUND_GIVING_HEAT);
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