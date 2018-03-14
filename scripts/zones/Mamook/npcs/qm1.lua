-----------------------------------
-- Area: Mamook
--  NPC: ??? (Spawn Chamrosh(ZNM T1))
-- !pos 206 14 -285 65
-----------------------------------
package.loaded["scripts/zones/Mamook/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mamook/TextIDs");
require("scripts/zones/Mamook/MobIDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2581) and not GetMobByID(CHAMROSH):isSpawned()) then -- Trade Floral Nectar
        player:confirmTrade();
        SpawnMob(CHAMROSH):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
