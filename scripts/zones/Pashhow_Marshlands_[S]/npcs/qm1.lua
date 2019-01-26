-----------------------------------
-- Area: Pashhow_Marshlands(S)
--  NPC: ??? (Kinepikwa)
-- Allow player to spawn Kinepikwa with Peiste pellets
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands_[S]/IDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2564) and not GetMobByID(ID.mob.KINEPIKWA):isSpawned()) then
        player:confirmTrade();
        SpawnMob(ID.mob.KINEPIKWA):updateClaim(player);
    end
end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
