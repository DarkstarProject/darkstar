-----------------------------------
-- Area: Quicksand Caves
--  NPC: qm2
--  Notes: Used to spawn Tribunus VII-I
-- !pos -49.944 -0.891 -139.485 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Quicksand_Caves/TextIDs");
require("scripts/zones/Quicksand_Caves/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Antican Tag
    if (npcUtil.tradeHas(trade, 1190) and not GetMobByID(TRIBUNUS_VII_I):isSpawned()) then
        player:confirmTrade();
        SpawnMob(TRIBUNUS_VII_I):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
