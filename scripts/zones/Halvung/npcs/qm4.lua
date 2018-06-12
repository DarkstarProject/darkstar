-----------------------------------
-- Area: Halvung
--  NPC: ??? (Spawn Achamoth(ZNM T3))
-- !pos -34 10 336 62
-----------------------------------
package.loaded["scripts/zones/Halvung/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Halvung/TextIDs");
require("scripts/zones/Halvung/MobIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2586) and not GetMobByID(ACHAMOTH):isSpawned()) then -- Rock Juice
        player:confirmTrade();
        SpawnMob(ACHAMOTH):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
