-----------------------------------
-- Area: Navukgo Execution Chamber
-- MOB: Khimaira 13
-----------------------------------
require("scripts/globals/allyassist");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobFight(mob,target)
    local assist = mob:getLocalVar("assist");

    if (assist == 0) then
        startAllyAssist(mob);
        mob:setLocalVar("assist", 1);
    end
end;

function onSpellPrecast(mob, spell)
end;

function onMobDeath(mob, player, isKiller)
end;

function onEventUpdate(player,csid,option)
    -- printf("updateCSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option,target)
    -- printf("finishCSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
