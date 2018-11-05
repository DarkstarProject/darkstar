-----------------------------------
-- Area: Mamook
--  NPC: ??? (Spawn Chamrosh(ZNM T1))
-- !pos 206 14 -285 65
-----------------------------------
local ID = require("scripts/zones/Mamook/IDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2581) and not GetMobByID(ID.mob.CHAMROSH):isSpawned()) then -- Trade Floral Nectar
        player:confirmTrade();
        SpawnMob(ID.mob.CHAMROSH):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
