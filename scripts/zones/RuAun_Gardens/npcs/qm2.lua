-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  ??? (Seiryu's Spawn)
-- Allows players to spawn the HNM Seiryu with a Gem of the East and a Springstone.
-- @pos 569 -70 -80 130
-----------------------------------
package.loaded["scripts/zones/RuAun_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/RuAun_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    -- Trade Gem of the East and Springstone
    if (GetMobAction(17309981) == 0 and trade:hasItemQty(1418,1) and trade:hasItemQty(1419,1) and trade:getItemCount() == 2) then
        player:tradeComplete();
        SpawnMob(17309981,300):updateClaim(player); -- Spawn Seiryu
        player:showText(npc,SKY_GOD_OFFSET + 9);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(SKY_GOD_OFFSET + 1);
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