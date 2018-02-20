-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: ??? (qm1)
-- Note: Used to spawn Phantom Worm
-- !pos 75.943 29.916 118.854 174
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/TextIDs");
-----------------------------------

function onSpawn(npc)
end;

function onTrade(player,npc,trade)

    local x = npc:getXPos();
    local y = npc:getYPos();
    local z = npc:getZPos();
    local mob = GetMobByID(Phantom_Worm);

    -- Trade Darksteel ore
    if (GetMobAction(Phantom_Worm) == 0 and trade:hasItemQty(645,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(Phantom_Worm):updateClaim(player); -- Phantom Worm
        mob:setPos(x+1,y,z+1);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
end;
