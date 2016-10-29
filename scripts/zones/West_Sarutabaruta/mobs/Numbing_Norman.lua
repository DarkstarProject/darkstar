-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Numbing Norman
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)
    -- Guesstimating 1 in 4 chance to paralysis on melee.
    if ((math.random(1,100) >= 25) or (target:hasStatusEffect(EFFECT_PARALYSIS) == true)) then
        return 0,0,0;
    else
        local duration = math.random(5,15);
        target:addStatusEffect(EFFECT_PARALYSIS,5,3,duration);
        return SUBEFFECT_PARALYSIS,0,EFFECT_PARALYSIS;
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,61,2);
    UpdateNMSpawnPoint(mob:getID());
end;
