-----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Lord of Onzozo
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/regimes")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1)
end

function onMonsterMagicPrepare(mob, target)
    local rnd = math.random()

    if rnd < 0.4 then
        return 201 -- Waterga III
    elseif rnd < 0.7 then
        return 214 -- Flood
    elseif rnd < 0.9 then
        return 361 -- Blindga
    else
        return 172 -- Water IV
    end
end

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 774, 1, dsp.regime.type.GROUNDS)
end