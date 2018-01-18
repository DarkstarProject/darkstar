-----------------------------------
-- Area: Bibiki Bay
-- NPC:  ??? COP mission spawn Dalham
-- !pos
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bibiki_Bay/TextIDs");
require("scripts/zones/Bibiki_Bay/MobIDs");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local cop = player:getCurrentMission(COP);
    
    if (cop == CALM_BEFORE_THE_STORM and not GetMobByID(DALHAM):isSpawned() and player:getVar("COP_Dalham_KILL") == 0) then
        SpawnMob(DALHAM):updateClaim(player);
    elseif (cop == CALM_BEFORE_THE_STORM and player:getVar("COP_Dalham_KILL") == 1) then
        player:startEvent(41);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 41) then
        player:setVar("COP_Dalham_KILL",2);
    end
end;
