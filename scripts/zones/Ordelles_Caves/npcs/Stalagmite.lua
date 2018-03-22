-----------------------------------
-- Area: Ordelles Caves
--  NPC: Stalagmite
-- Involved In Quest: Sharpening the Sword
-- !pos -51 0.1 3 193
-----------------------------------
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Ordelles_Caves/TextIDs");
require("scripts/zones/Ordelles_Caves/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local stsCS = player:getVar("sharpeningTheSwordCS");

    if (stsCS == 3 and player:getVar("PolevikKilled") == 1) then
        npcUtil.giveKeyItem(player, ORDELLE_WHETSTONE)
        player:setVar("PolevikKilled",0);
        player:setVar("sharpeningTheSwordCS",4)
    elseif (stsCS == 3 and not GetMobByID(POLEVIK):isSpawned()) then
        SpawnMob(POLEVIK):updateClaim(player);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
