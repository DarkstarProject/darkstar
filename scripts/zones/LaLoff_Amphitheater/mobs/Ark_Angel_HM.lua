-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel HM
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 50);
end;

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            {id = dsp.jsa.MIGHTY_STRIKES},
            {id = dsp.jsa.MIJIN_GAKURE},
        },
    })
end

function onMobEngaged(mob,target)
    local mobid = mob:getID();

    for member = mobid, mobid+7 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == dsp.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;
