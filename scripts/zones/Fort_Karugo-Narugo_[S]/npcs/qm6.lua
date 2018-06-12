----------------------------------
-- Area: Fort Karugo Narugo [S]
--  NPC: ???
-- Type: Quest
-- !pos -63 -75 4 96
-----------------------------------
package.loaded["scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs");
require("scripts/zones/Fort_Karugo-Narugo_[S]/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ttsStat = player:getVar("TigressStrikesProg");
    
    if (ttsStat == 1) then
        player:startEvent(102);
    elseif (player:getVar("WarLynxKilled") == 1) then
        player:startEvent(103);
    elseif (ttsStat == 2 and not GetMobByID(TIGRESS_STRIKES_WAR_LYNX):isSpawned()) then
        SpawnMob(TIGRESS_STRIKES_WAR_LYNX):updateClaim(player);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 102) then
        player:setVar("TigressStrikesProg", 2);
    elseif (csid == 103) then
        player:setVar("TigressStrikesProg", 3);
    end
end;
