-----------------------------------
-- Area: Mount Zhayolm
--  NPC: ??? (Spawn Brass Borer(ZNM T1))
-- !pos 399 -27 120 61
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2590) and not GetMobByID(ID.mob.BRASS_BORER):isSpawned()) then -- Shadeleaves
        player:confirmTrade();
        SpawnMob(ID.mob.BRASS_BORER):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
