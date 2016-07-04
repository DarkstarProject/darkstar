-----------------------------------
-- Area: Outer Horutoto Ruins
--  MOB: Queen of Swords
-----------------------------------

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING and player:getVar("MissionStatus") == 4 and GetMobAction(17572202) == 0) then
        player:setVar("MissionStatus",5)
    end
end;