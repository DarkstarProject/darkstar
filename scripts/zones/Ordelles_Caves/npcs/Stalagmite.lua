-----------------------------------
-- Area: Ordelles Caves
--  NPC: Stalagmite
-- Involved In Quest: Sharpening the Sword
-- !pos -51 0.1 3 193
-----------------------------------
local ID = require("scripts/zones/Ordelles_Caves/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local stsCS = player:getVar("sharpeningTheSwordCS");

    if (stsCS == 3 and player:getVar("PolevikKilled") == 1) then
        npcUtil.giveKeyItem(player, dsp.ki.ORDELLE_WHETSTONE)
        player:setVar("PolevikKilled",0);
        player:setVar("sharpeningTheSwordCS",4)
    elseif (stsCS == 3 and not GetMobByID(ID.mob.POLEVIK):isSpawned()) then
        SpawnMob(ID.mob.POLEVIK):updateClaim(player);
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
