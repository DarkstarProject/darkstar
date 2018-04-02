-----------------------------------
-- Area: Xarcabard
--  NM:  Biast
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    -- Set Biast's ToD
    SetServerVariable("[POP]Biast", os.time() + 75600); -- 21 hour
    DisallowRespawn(mob:getID()-1, false);
    GetMobByID(mob:getID()-1):setRespawnTime(GetMobRespawnTime(mob:getID()-1));

end;

function onAdditionalEffect(mob,target,damage)

    if ((math.random(1,15) ~= 5) or (target:hasStatusEffect(dsp.effects.TERROR) == true)) then
        return 0,0,0;
    else
        local duration = 5;
        target:addStatusEffect(dsp.effects.TERROR,1,0,duration);
        mob:resetEnmity(target);
        return SUBEFFECT_NONE,0,EFFECT_TERROR;
    end

end;