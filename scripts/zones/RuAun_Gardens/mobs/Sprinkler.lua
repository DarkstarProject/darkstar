-----------------------------------	
-- Area: RuAun Gardens	
-- MOB:  Sprinkler	
-----------------------------------	
	
require("scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,142,2);
	checkRegime(killer,mob,143,1);
end;	

-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    return 212; -- burst
    
    -- -- Example of how you can select logical spells
    -- if (target:getMod(MOD_UTSUSEMI) > 0) then
    --    return 189; -- stonega
    -- else
    --     return 212; -- burst
    -- end
end;
