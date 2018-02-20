-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: ??? (qm2)
-- Note: Used to spawn Cancer & Bastok mission 8-2
-- !pos -25.238 -12.785 -148.393 174
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/TextIDs");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)


    -- Trade quus
    if (GetMobAction(17490231) == 0 and GetMobAction(17490232) == 0 and trade:hasItemQty(4514,1) and trade:getItemCount() == 1) then
        player:tradeComplete();

        if (math.random((1),(14)) <= 13) then
            SpawnMob(17490232) -- Robber Crab
        else
            SpawnMob(Cancer) -- Cancer about 7% chance to pop per trade
        end
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
player:messageSpecial(FISHBONES);
end;
