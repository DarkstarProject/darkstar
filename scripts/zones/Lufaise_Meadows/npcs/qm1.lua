-----------------------------------
-- Area: Lufaise Meadows
--  NPC: ??? - Amaltheia spawn
-- !pos 347.897 -10.895 264.382 24
-----------------------------------
package.loaded["scripts/zones/Lufaise_Meadows/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lufaise_Meadows/TextIDs");
require("scripts/zones/Lufaise_Meadows/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 15066) and not GetMobByID(AMALTHEIA):isSpawned()) then -- Relic Shield
        player:confirmTrade();
        SpawnMob(AMALTHEIA):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_THE_ORDINARY);
end;
