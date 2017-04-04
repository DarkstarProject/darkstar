---------------------------------------------------
-- Ranged Attack
---------------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/weaponskills")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local params = {
        numHits = 1,
        atkmulti = 1.5,
        ftp100 = 1.0,
        ftp200 = 1.25,
        ftp300 = 1.5,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        str_wsc = 0.0,
        dex_wsc = 0.0,
        vit_wsc = 0.0,
        agi_wsc = 0.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }

    local damage = doRangedWeaponskill(automaton, target, 0, params, math.random(1000, 3000), true)

    -- Miss message
    if damage == 0 then
        skill:setMsg(188)
    end

    return damage
end
