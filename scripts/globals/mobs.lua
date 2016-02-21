-----------------------------------
--
--
--
-----------------------------------
package.loaded["scripts/globals/conquest"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/conquest");
require("scripts/globals/status");

-----------------------------------
--
-----------------------------------

-- function onMobDeathEx(mob, killer, ally, killType)
function onMobDeathEx(mob, killer, ally, isWeaponSkillKill)
    -- DRK quest - Blade Of Darkness
    local BladeofDarkness = killer:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);
    local BladeofDeath = killer:getQuestStatus(BASTOK, BLADE_OF_DEATH);
    local ChaosbringerKills = killer:getVar("ChaosbringerKills");

    if (BladeofDarkness == QUEST_ACCEPTED or BladeofDeath == QUEST_ACCEPTED) then
        if (killer:getEquipID(SLOT_MAIN) == 16607 and isWeaponSkillKill == false) then
            if (ChaosbringerKills < 200) then
                killer:setVar("ChaosbringerKills", ChaosbringerKills + 1);
            end
        end
    end

    if (ally:getCurrentMission(WINDURST) == A_TESTING_TIME) then
        if (ally:hasCompletedMission(WINDURST,A_TESTING_TIME) and ally:getZoneID() == 118) then
            ally:setVar("testingTime_crea_count",ally:getVar("testingTime_crea_count") + 1);
        elseif (ally:hasCompletedMission(WINDURST,A_TESTING_TIME) == false and ally:getZoneID() == 117) then
            ally:setVar("testingTime_crea_count",ally:getVar("testingTime_crea_count") + 1);
        end
    end

    -- doMagiantTrialCheck(mob, killer, ally, killType);
end;