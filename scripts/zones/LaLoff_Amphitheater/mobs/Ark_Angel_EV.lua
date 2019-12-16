-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel EV
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(dsp.mod.REGAIN, 50);
end;

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.BENEDICTION, hpp = math.random(20, 30)}, -- "Uses Benediction once."
            {id = dsp.jsa.INVINCIBLE, hpp = math.random(90, 95), cooldown = 90}, -- "Uses Invincible many times."
        },
    })
end

function onMobEngaged(mob,target)
    local mobid = mob:getID()

    for member = mobid-4, mobid+3 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == dsp.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;
