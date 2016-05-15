-----------------------------------
-- Area: Xarcabard
--  NM:  Biast
-- ID: 17235988
-----------------------------------
require("scripts/globals/status");
-----------------------------------


-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    -- Set Biast's ToD
    SetServerVariable("[POP]Biast", os.time(t) + 75600); -- 21 hour
    DeterMob(mob:getID()-1, false);
    GetMobByID(mob:getID()-1):setRespawnTime(GetMobRespawnTime(mob:getID()-1));

end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)

    if ((math.random(1,15) ~= 5) or (target:hasStatusEffect(EFFECT_TERROR) == true)) then
        return 0,0,0;
    else
        local duration = 5;
        target:addStatusEffect(EFFECT_TERROR,1,0,duration);
        mob:resetEnmity(target);
        return SUBEFFECT_NONE,0,EFFECT_TERROR;
    end

end;