-----------------------------------
-- Area: Ifrit's Cauldron
--  NPC: qm1 (???)
-- Notes: Used to spawn Tarasque
-- !pos 126 18 166 0
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 1189) and not GetMobByID(ID.mob.TARASQUE):isSpawned()) then -- Rattling Egg
        player:confirmTrade();
        SpawnMob(ID.mob.TARASQUE):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.EGGSHELLS_LIE_SCATTERED);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
