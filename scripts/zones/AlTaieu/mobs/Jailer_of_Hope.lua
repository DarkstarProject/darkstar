-----------------------------------
-- Area: Al'Taieu
--  NM:  Jailer of Hope
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setSpellList(0); -- If it dies with the ability to cast spells, the next spawn would be able to cast from the start.
    mob:setMobMod(MOBMOD_MAGIC_COOL, 20); -- This gives around 6 - 15 seconds between casts. Doesn't seem to work anywhere except in this function.
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    if (mob:getLocalVar("SpellTime") < os.time() and mob:getLocalVar("SpellTime") ~= 0) then -- Checks for it being 0 because it gets set to 0 to avoid setting the spell list repeatedly
        mob:setSpellList(0);
        mob:setLocalVar("SpellTime", 0)
    end;
end;

-----------------------------------
-- onMobWeaponSkill Action
-----------------------------------

function onMobWeaponSkill(target, mob, skill)
    if (skill:getID() == 1102) then -- Set spell list for Burst2/Thundaga3 upon using Plasma Charge. Allow for 60 seconds.
        mob:setSpellList(140);
        mob:setLocalVar("SpellTime", os.time() + 60);
    end;
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(mob,target,damage)
    -- Guestimating 2 in 3 chance to stun on melee.
    if ((math.random(1,100) >= 66) or (target:hasStatusEffect(EFFECT_STUN) == true)) then
        return 0,0,0;
    else
        local duration = math.random(4,8);
        target:addStatusEffect(EFFECT_STUN,5,0,duration);
        return SUBEFFECT_STUN,0,EFFECT_STUN;
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;