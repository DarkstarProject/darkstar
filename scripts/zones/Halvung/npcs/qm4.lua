-----------------------------------
-- Area: Halvung
--  NPC: ??? (Spawn Achamoth(ZNM T3))
-- !pos -34 10 336 62
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2586) and not GetMobByID(ID.mob.ACHAMOTH):isSpawned()) then -- Rock Juice
        player:confirmTrade();
        SpawnMob(ID.mob.ACHAMOTH):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
