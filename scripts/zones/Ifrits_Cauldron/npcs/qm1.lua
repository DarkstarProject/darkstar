-----------------------------------
-- Area: Ifrit's Cauldron
--  NPC: qm1 (???)
-- Notes: Used to spawn Tarasque
-- !pos 126 18 166 0
-----------------------------------
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Ifrits_Cauldron/TextIDs");
require("scripts/zones/Ifrits_Cauldron/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 1189) and not GetMobByID(TARASQUE):isSpawned()) then -- Rattling Egg
        player:confirmTrade();
        SpawnMob(TARASQUE):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(EGGSHELLS_LIE_SCATTERED);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
