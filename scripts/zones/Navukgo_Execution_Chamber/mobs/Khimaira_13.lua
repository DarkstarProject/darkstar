-----------------------------------
-- Area: Navukgo Execution Chamber
--  Mob: Khimaira 13
-----------------------------------
require("scripts/globals/allyassist");
-----------------------------------

function onMobFight(mob,target)
    local assist = mob:getLocalVar("assist");

    if (assist == 0) then
        dsp.ally.startAssist(mob);
        mob:setLocalVar("assist", 1);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onEventUpdate(player,csid,option)
    -- printf("updateCSID: %u",csid);
end;

function onEventFinish(player,csid,option,target)
    -- printf("finishCSID: %u",csid);
end;
