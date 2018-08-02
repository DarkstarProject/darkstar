-----------------------------------
-- Area: Lufaise Meadows
--  NPC: ??? - Amaltheia spawn
-- !pos 347.897 -10.895 264.382 24
-----------------------------------
local ID = require("scripts/zones/Lufaise_Meadows/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 15066) and not GetMobByID(ID.mob.AMALTHEIA):isSpawned()) then -- Relic Shield
        player:confirmTrade();
        SpawnMob(ID.mob.AMALTHEIA):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
end;
