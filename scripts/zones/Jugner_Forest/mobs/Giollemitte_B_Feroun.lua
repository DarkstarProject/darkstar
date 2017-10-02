-----------------------------------
-- Area: Jugner Forest
-- Mob: Giollemitte B Feroun
-- Involved in Quest: A Timely Visit
-- ID: 17203666
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    if (mob:getHPP() < 60 and mob:getLocalVar("invincible") == 0) then
        mob:useMobAbility(694);
        mob:setLocalVar("invincible", 1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local ATimelyVisit = player:getQuestStatus(SANDORIA,A_TIMELY_VISIT);
    local ATimelyVisitProgress = player:getVar("ATimelyVisitProgress");

    if (ATimelyVisit == 1 and ATimelyVisitProgress == 9) then
        player:setVar("ATimelyVisitProgress",10);
    end;
end;
