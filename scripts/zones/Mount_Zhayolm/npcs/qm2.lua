-----------------------------------
-- Area: Mount Zhayolm
--  NPC: ??? (Spawn Claret(ZNM T1))
-- !pos 497 -9 52 61
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2591) and not GetMobByID(ID.mob.CLARET):isSpawned()) then -- Pectin
        player:confirmTrade();
        SpawnMob(ID.mob.CLARET):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
