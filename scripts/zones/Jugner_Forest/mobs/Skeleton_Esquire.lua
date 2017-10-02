-----------------------------------
-- Area: Jugner Forest
-- Mob: Skeleton Esquire
-- Involved in Quest: A Timely Visit
-- ID: 17203667
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    if (mob:getHPP() < 45 and mob:getLocalVar("bloodWeapon") == 0) then
        mob:useMobAbility(695);
        mob:setLocalVar("bloodWeapon", 1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

--function onMobDeath(mob, player, isKiller)
--end;