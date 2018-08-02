-----------------------------------
-- Area: Halvung
--  NPC: ??? (Spawn Big Bomb)
-- !pos -233.830 13.613 286.714 62
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    if (npcUtil.tradeHas(trade, 2384) and not GetMobByID(ID.mob.BIG_BOMB):isSpawned()) then -- Smokey Flask
        player:confirmTrade();
        SpawnMob(ID.mob.BIG_BOMB):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.BLUE_FLAMES);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
