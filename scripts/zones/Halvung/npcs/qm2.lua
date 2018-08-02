-----------------------------------
-- Area: Halvung
--  NPC: ??? (Spawn Dextrose(ZNM T2))
-- !pos -144 11 464 62
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2589) and not GetMobByID(ID.mob.DEXTROSE):isSpawned()) then -- Granulated Sugar
        player:confirmTrade();
        SpawnMob(ID.mob.DEXTROSE):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
