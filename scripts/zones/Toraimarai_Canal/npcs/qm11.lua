-----------------------------------
-- Area: Toraimarai Canal
-- NPC:  ???
-- Involved In Quest: The Root of the Problem
-- !pos 19 17 59 169
-----------------------------------
require("scripts/zones/Toraimarai_Canal/MobIDs");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getVar("rootProblem") == 2) then
        if (not GetMobByID(MAGIC_SLUDGE):isSpawned() and player:getVar("rootProblemQ1") == 2 and player:getVar("rootProblemQ2") == 2) then
            player:startEvent(48);
        end
    elseif (player:getVar("rootProblem") == 3) then
        player:startEvent(55);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 48 and option ~= 0) then
        SpawnMob(MAGIC_SLUDGE):updateClaim(player);
    end
end;
