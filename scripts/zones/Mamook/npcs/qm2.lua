-----------------------------------
-- Area: Mamook
--  NPC: ??? (Spawn Iriri Samariri(ZNM T2))
-- !pos -118 7 -80 65
-----------------------------------
package.loaded["scripts/zones/Mamook/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mamook/TextIDs");
require("scripts/zones/Mamook/MobIDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2579) and not GetMobByID(IRIRI_SAMARIRI):isSpawned()) then -- Trade Samariri Corpsehair
        player:confirmTrade();
        SpawnMob(IRIRI_SAMARIRI):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
