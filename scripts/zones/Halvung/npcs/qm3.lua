-----------------------------------
-- Area: Halvung
--  NPC: ??? (Spawn Reacton(ZNM T2))
-- !pos 18 -9 213 62
-----------------------------------
package.loaded["scripts/zones/Halvung/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Halvung/TextIDs");
require("scripts/zones/Halvung/MobIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2588) and not GetMobByID(REACTON):isSpawned()) then -- Bone Charcoal
        player:confirmTrade();
        SpawnMob(REACTON):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
