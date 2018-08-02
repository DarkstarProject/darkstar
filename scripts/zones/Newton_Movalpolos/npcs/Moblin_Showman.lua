-----------------------------------
-- Area: Newton Movalpolos
--  NPC: Moblin Showman - Bugbear Matman
-- !pos 124.544 19.988 -60.670 12
-----------------------------------
local ID = require("scripts/zones/Newton_Movalpolos/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (not GetMobByID(ID.mob.BUGBEAR_MATMAN):isSpawned() and npcUtil.tradeHas(trade, 1878)) then -- Air tank
        player:confirmTrade();
        player:showText(npc, ID.text.SHOWMAN_ACCEPT);
        SpawnMob(ID.mob.BUGBEAR_MATMAN):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    else
        player:showText(npc, ID.text.SHOWMAN_DECLINE);
    end
end;

function onTrigger(player,npc)
    player:showText(npc, ID.text.SHOWMAN_TRIGGER);
end;
