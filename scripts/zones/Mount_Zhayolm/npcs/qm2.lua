-----------------------------------
-- Area: Mount Zhayolm
--  NPC: ??? (Spawn Claret(ZNM T1))
-- !pos 497 -9 52 61
-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mount_Zhayolm/TextIDs");
require("scripts/zones/Mount_Zhayolm/MobIDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2591) and not GetMobByID(CLARET):isSpawned()) then -- Pectin
        player:confirmTrade();
        SpawnMob(CLARET):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
