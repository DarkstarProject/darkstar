-----------------------------------
-- Area: Pso'xja
--  NPC: ??? (qm1)
-- Notes: Used to spawn Golden-Tongued Culberry
-- !pos -270.063 31.395 256.812 9
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (not GetMobByID(ID.mob.GOLDEN_TONGUED_CULBERRY):isSpawned()) then
        if (npcUtil.tradeHas(trade, 18014)) then -- odorous knife
            player:confirmTrade();
            SpawnMob(ID.mob.GOLDEN_TONGUED_CULBERRY):updateClaim(player);
            SetDropRate(1512, 13145, 500);
            npc:setStatus(dsp.status.DISAPPEAR);
        elseif (npcUtil.tradeHas(trade, 18016)) then -- odorous knife +1
            player:confirmTrade();
            SpawnMob(ID.mob.GOLDEN_TONGUED_CULBERRY):updateClaim(player);
            SetDropRate(1512, 13145, 1000);
            npc:setStatus(dsp.status.DISAPPEAR);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.BROKEN_KNIFE);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
