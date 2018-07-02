---------------------------------------------
--  Pinecone Bomb
--  Description: Single target damage with sleep.
-- Todo add damage to log, atm if it shows damage it wont sleep the mob
---------------------------------------------
require("scripts/globals/status")
require("/scripts/globals/bluemagic")
require("scripts/globals/msg");
---------------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
    local multi = 1.25
    if(caster:hasStatusEffect(dsp.effect.AZURE_LORE)) then
        multi = multi + 0.50
    end
        params.tpmod = TPMOD_CRITICAL
        params.dmgtype = DMGTYPE_PIERCE
        params.scattr = SC_DARK
        params.numhits = 1
        params.multiplier = multi
        params.tp150 = 1.25
        params.tp300 = 1.25
        params.azuretp = 1.25
        params.duppercap = 8
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.2
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
    damage = BluePhysicalSpell(caster, target, spell, params)
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if (damage > 0) then
        local typeEffect = dsp.effect.SLEEP_I
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect,1,0,30)
        spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS);
    end
        
    return typeEffect
end