-----------------------------------
-- Area: Lower_Delkfutts_tower
--  Mob: Disaster_Idol
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onMobEngaged(mob,target)
    local DayofWeek = VanadielDayElement();

    mob:setSpellList(118 + DayofWeek);
    mob:setLocalVar("Element", DayofWeek+1);

end;

function onMobFight(mob,target)
    -- TODO: Has level mimic of person who spawned it. Minimum level 65. HP should scale accordingly.

    local DayofWeek = VanadielDayElement();
    local Element = mob:getLocalVar("Element");

    if (DayofWeek + 1 ~= Element) then
        mob:setSpellList(118 + DayofWeek);
        mob:setLocalVar("Element", DayofWeek+1);
    end
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Tenzen_s_Path") == 6) then
        player:setVar("COP_Tenzen_s_Path",7);
    end
end;