-----------------------------------
-- Area: Oldton_Movalpolos
--  NPC: Scrawled_Writing
-- Allows players to spawn NM Goblin Wolfman
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Oldton_Movalpolos/TextIDs");
-----------------------------------

function onSpawn(npc)
end;

function onTrade(player,npc,trade)

    local x = npc:getXPos();
    local y = npc:getYPos();
    local z = npc:getZPos();
    local mob = GetMobByID(16822459);

    -- Trade Goblin Drink
    if (GetMobAction(16822459) == 0 and trade:hasItemQty(4541,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(16822459):updateClaim(player); -- Goblin Wolfman
        mob:setPos(x-1,y,z);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
end;
