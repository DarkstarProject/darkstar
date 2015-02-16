----------------------------------
-- Area: Labyrinth of Onzozo
-- NM: Lord of Onzozo
-----------------------------------

require("/scripts/globals/fieldsofvalor");
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");
package.loaded["scripts/zones/Labyrinth_of_Onzozo/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");
-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_MACC,400);
	mob:addMod(MOD_REGAIN,33);
	mob:addMod(MOD_DOUBLE_ATTACK,15);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob,target)
    local MobHP = mob:getHPP();
	if (MobHP < 75) then
		mob:addStatusEffect(EFFECT_HASTE,1,0,6000);
	end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	checkRegime(killer,mob,774,1);
	killer:addTitle(TARUTARU_MURDER_SUSPECT);

    checkGoVregime(killer,mob,774,1);

    -- Set LoO's Window Open Time
    local wait = math.random((75600),(86400));
    SetServerVariable("[POP]Lord_of_Onzozo", os.time(t) + wait); -- 18-24 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Lord_of_Onzozo");
    SetServerVariable("[PH]Lord_of_Onzozo", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;