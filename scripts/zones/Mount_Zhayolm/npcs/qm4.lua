-----------------------------------
-- Area: Mount Zhayolm
--  NPC: ??? (Spawn Khromasoul Bhurborlor(ZNM T3))
-- !pos 88 -22 70 61
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2585) and not GetMobByID(ID.mob.KHROMASOUL_BHURBORLOR):isSpawned()) then -- Vinegar Pie
        player:confirmTrade();
        SpawnMob(ID.mob.KHROMASOUL_BHURBORLOR):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
