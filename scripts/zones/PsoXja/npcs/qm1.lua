-----------------------------------
-- Area: Pso'xja
--  NPC: ??? (qm1)
-- Notes: Used to spawn Golden-Tongued Culberry
-- !pos -270.063 31.395 256.812 9
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/PsoXja/TextIDs");
require("scripts/zones/PsoXja/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (not GetMobByID(GOLDEN_TONGUED_CULBERRY):isSpawned()) then
        if (npcUtil.tradeHas(trade, 18014)) then -- odorous knife
            player:confirmTrade();
            SpawnMob(GOLDEN_TONGUED_CULBERRY):updateClaim(player);
            SetDropRate(1512, 13145, 500);
            npc:setStatus(STATUS_DISAPPEAR);
        elseif (npcUtil.tradeHas(trade, 18016)) then -- odorous knife +1
            player:confirmTrade();
            SpawnMob(GOLDEN_TONGUED_CULBERRY):updateClaim(player);
            SetDropRate(1512, 13145, 1000);
            npc:setStatus(STATUS_DISAPPEAR);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(BROKEN_KNIFE);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
