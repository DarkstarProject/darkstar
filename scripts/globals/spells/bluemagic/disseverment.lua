require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_ACC; params.dmgtype = DMGTYPE_PIERCE; params.scattr = SC_DISTORTION;
	params.numhits = 5;
	params.multiplier = 1.5; params.tp150 = 0.8; params.tp300 = 1.0; params.azuretp = 1.0; params.duppercap = 100; -- D upper >=69
	params.str_wsc = 0.2; params.dex_wsc = 0.2; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    
    poison = target:getStatusEffect(EFFECT_POISON);
    local chance = math.random();
    if (chance < 0.95 and poison == nil) then
        local power = (caster:getMainLvl()/5) + 3; -- from http://wiki.ffxiclopedia.org/wiki/Disseverment
        target:addStatusEffect(EFFECT_POISON,power,3,180); -- for 180secs
    end
    
    return damage;
end;