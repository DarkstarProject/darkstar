-----------------------------------
-- Area: Lower_Delkfutts_tower
--   NM: Disaster_Idol
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onMobEngaged(mob, target)
    local dayofWeek = VanadielDayElement()

    mob:setSpellList(118 + dayofWeek)
    mob:setLocalVar("Element", dayofWeek + 1)
end

function onMobFight(mob, target)
    -- TODO: Has level mimic of person who spawned it. Minimum level 65. HP should scale accordingly.

    local dayofWeek = VanadielDayElement()
    local element = mob:getLocalVar("Element")

    if dayofWeek + 1 ~= element then
        mob:setSpellList(118 + dayofWeek)
        mob:setLocalVar("Element", dayofWeek + 1)
    end
end

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(COP) == dsp.mission.id.cop.THREE_PATHS and player:getVar("COP_Tenzen_s_Path") == 6 then
        player:setVar("COP_Tenzen_s_Path", 7)
    end
end