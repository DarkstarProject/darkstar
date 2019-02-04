-----------------------------------
-- Area: LaLoff Amphitheater
--  MOB: Ark Angel TT
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.UFASTCAST, 30);
end;

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            {id = dsp.jsa.BLOOD_WEAPON},
            {
                id = dsp.jsa.MANAFONT,
                endCode = function(mob) -- "Uses Manafont and ... Will cast Sleepga followed by Meteor."
                    mob:castSpell(273) -- sleepga
                    mob:castSpell(218) -- meteor
                end,
            },
        },
    })
end

function onMobEngaged(mob,target)
    local mobid = mob:getID()

    for member = mobid-5, mobid+2 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == dsp.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end;

function onMobFight(mob,target)

    if (mob:hasStatusEffect(dsp.effect.BLOOD_WEAPON) and bit.band(mob:getBehaviour(),dsp.behavior.STANDBACK) > 0) then
        mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(dsp.behavior.STANDBACK)))
        mob:setMobMod(dsp.mobMod.TELEPORT_TYPE,0);
        mob:setMobMod(dsp.mobMod.SPAWN_LEASH,0);
        mob:setSpellList(0);
    end
    if (not mob:hasStatusEffect(dsp.effect.BLOOD_WEAPON) and bit.band(mob:getBehaviour(),dsp.behavior.STANDBACK) == 0) then
        mob:setBehaviour(bit.bor(mob:getBehaviour(), dsp.behavior.STANDBACK))
        mob:setMobMod(dsp.mobMod.TELEPORT_TYPE,1);
        mob:setMobMod(dsp.mobMod.SPAWN_LEASH,22);
        mob:setSpellList(39);
    end
end;

function onMobDeath(mob, player, isKiller)
end;
