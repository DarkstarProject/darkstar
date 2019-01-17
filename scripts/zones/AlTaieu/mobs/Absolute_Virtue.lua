-----------------------------------
-- Area: Al'Taieu
--  HNM: Absolute Virtue
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/magic");
-----------------------------------

function onMobSpawn(mob)
    -- setMod
    mob:setMod(dsp.mod.REGEN, 500);

    local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE);
    -- Special check for regen modification by JoL pets killed
    if (JoL:getLocalVar("JoL_Qn_xzomit_Killed") == 9) then
        mob:addMod(dsp.mod.REGEN, -130)
    end
    if (JoL:getLocalVar("JoL_Qn_hpemde_Killed") == 9) then
        mob:addMod(dsp.mod.REGEN, -130)
    end
end;

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then -- Meteor
        spell:setAoE(dsp.magic.aoe.RADIAL);
        spell:setFlag(dsp.magic.spellFlag.HIT_ALL);
        spell:setRadius(30);
        spell:setAnimation(280); -- AoE Meteor Animation
        spell:setMPCost(1);
    end
end;

function onMagicHit(caster, target, spell)
    local REGEN = target:getMod(dsp.mod.REGEN);
    local DAY = VanadielDayElement();
    local ELEM = spell:getElement();
    if (GetServerVariable("AV_Regen_Reduction") < 60) then
        -- Had to serverVar the regen instead of localVar because localVar reset on claim loss.
        if (ELEM == DAY and (caster:isPC() or caster:isPet())) then
            SetServerVariable("AV_Regen_Reduction", 1+GetServerVariable("AV_Regen_Reduction"));
            target:addMod(dsp.mod.REGEN, -2);
        end
    end
    return 1;
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.VIRTUOUS_SAINT);
end;