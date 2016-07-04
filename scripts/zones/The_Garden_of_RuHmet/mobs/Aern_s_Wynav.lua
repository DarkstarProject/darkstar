-----------------------------------
-- Area: The Garden of Ru'Hmet
--  MOB: Aern_s_Wynav
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/The_Garden_of_RuHmet/MobIDs");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    -- Ix'Aern DRG pets are Wyverns that 2hour.
    if (mob:getID() >= wynavA and mob:getID() <= wynavC) then
        mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
    end
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- OnMobDespawn
-----------------------------------
function onMobDespawn( mob )
end;