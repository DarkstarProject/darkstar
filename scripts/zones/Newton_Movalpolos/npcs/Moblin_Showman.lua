-----------------------------------
-- Area: Newton Movalpolos
--  NPC: Moblin Showman - Bugbear Matman
-- !pos 124.544 19.988 -60.670 12
-----------------------------------
package.loaded["scripts/zones/Newton_Movalpolos/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Newton_Movalpolos/TextIDs");
require("scripts/zones/Newton_Movalpolos/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (not GetMobByID(BUGBEAR_MATMAN):isSpawned() and npcUtil.tradeHas(trade, 1878)) then -- Air tank
        player:confirmTrade();
        player:showText(npc, SHOWMAN_ACCEPT);
        SpawnMob(BUGBEAR_MATMAN):updateClaim(player);
        npc:setStatus(STATUS_DISAPPEAR);
    else
        player:showText(npc, SHOWMAN_DECLINE);
    end
end;

function onTrigger(player,npc)
     player:showText(npc, SHOWMAN_TRIGGER);
end;
