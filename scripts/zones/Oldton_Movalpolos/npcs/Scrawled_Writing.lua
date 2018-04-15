-----------------------------------
-- Area: Oldton_Movalpolos
--  NPC: Scrawled_Writing
-- Allows players to spawn NM Goblin Wolfman
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Oldton_Movalpolos/MobIDs");
<<<<<<< HEAD
require("scripts/globals/npc_util");
require("scripts/globals/status");
=======
require("scripts/zones/Oldton_Movalpolos/TextIDs");

>>>>>>> 225f7c5f1ee6a44797c8faf501af217dc417f0a0
-----------------------------------

function onSpawn(npc)
end;

function onTrade(player,npc,trade)

    local x = npc:getXPos();
    local y = npc:getYPos();
    local z = npc:getZPos();
    local mob = GetMobByID(GOBLIN_WOLFMAN);

    -- Trade Goblin Drink
    if (GetMobAction(GOBLIN_WOLFMAN) == 0 and trade:hasItemQty(4541,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(GOBLIN_WOLFMAN):updateClaim(player); -- Goblin Wolfman
        mob:setPos(x-1,y,z);
<<<<<<< HEAD
        SpawnMob(GOBLIN_WOLFMAN):updateClaim(player);
		npc:setStatus(STATUS_DISAPPEAR);
=======
        npc:setStatus(STATUS_DISAPPEAR);
>>>>>>> 225f7c5f1ee6a44797c8faf501af217dc417f0a0
    end
end;

function onTrigger(player,npc)
end;
