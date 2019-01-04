-----------------------------------
-- Area: Bibiki Bay
--  MOB: Dalham
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM and player:getVar("COP_Dalham_KILL") == 0) then
        player:setVar("COP_Dalham_KILL",1);
    end
end;