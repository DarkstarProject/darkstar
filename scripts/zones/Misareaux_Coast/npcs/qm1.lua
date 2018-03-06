-----------------------------------
-- Area: Misareaux_Coast
--  NPC: ??? (Spawn Gration)
-- !pos 113.563 -16.302 38.912 25
-----------------------------------
package.loaded["scripts/zones/Misareaux_Coast/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Misareaux_Coast/TextIDs");
require("scripts/zones/Misareaux_Coast/MobIDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    if ( not GetMobByID(GRATION):isSpawned() and (npcUtil.tradeHas(trade, 12370) or npcUtil.tradeHas(trade, 12359)) ) then -- Hickory Shield or Picaroon's Shield
        player:confirmTrade();
        SpawnMob(GRATION):updateClaim(player);
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
