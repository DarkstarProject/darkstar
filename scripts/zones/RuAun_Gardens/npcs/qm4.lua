-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  ??? (Suzaku's Spawn)
-- Allows players to spawn the HNM Suzaku with a Gem of the South and a Summerstone.
-- @pos -514 -70 -264 130
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/RuAun_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    -- Trade Gem of the South and Summerstone
    if (GetMobAction(17309983) == 0 and trade:hasItemQty(1420,1) and trade:hasItemQty(1421,1) and trade:getItemCount() == 2) then
        player:tradeComplete();
        SpawnMob(17309983,300):updateClaim(player); -- Spawn Suzaku
        player:showText(npc,SKY_GOD_OFFSET + 7);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(SKY_GOD_OFFSET + 3);
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