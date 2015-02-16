-----------------------------------
-- Area: Davoi
--  NM:  Blubbery Bulge
-- Involved in Quest: The Miraculous Dale
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_AUTO_SPIKES,mob:getShortID());
    mob:addStatusEffect(EFFECT_DAMAGE_SPIKES,5,0,0);
    mob:getStatusEffect(EFFECT_DAMAGE_SPIKES):setFlag(32);
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    -- Set PH back to normal
    local PH = GetServerVariable("[PH]Blubbery_Bulge");
    SetServerVariable("[PH]Blubbery_Bulge", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
    DeterMob(mob:getID(), true);
end;

-----------------------------------
-- onSpikesDamage
-----------------------------------

function onSpikesDamage(mob,target,damage)
    local RAND = math.random(0,99);
    if (RAND >= 33) then
        return 0,0,0;
    else
        local dmg = math.random(3,9);
        target:delStatusEffect(EFFECT_DEFENSE_BOOST)
        if (not target:hasStatusEffect(EFFECT_DEFENSE_DOWN)) then
            target:addStatusEffect(EFFECT_DEFENSE_DOWN, 10, 0, 20);
        end
        target:delStatusEffect(EFFECT_ATTACK_BOOST)
        if (not target:hasStatusEffect(EFFECT_ATTACK_DOWN)) then
            target:addStatusEffect(EFFECT_ATTACK_DOWN, 10, 0, 20);
        end
        return SUBEFFECT_DELUGE_SPIKES,44,dmg;
    end
end;