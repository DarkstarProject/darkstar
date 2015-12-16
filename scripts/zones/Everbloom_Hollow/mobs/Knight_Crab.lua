-----------------------------------
-- Area: Everbloom Hollow
-- NPC:  Knight Crab
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob,target)
	
end;
-----------------------------------
-- onMonsterMagicPrepare
-----------------------------------
function onMonsterMagicPrepare(mob,target)
	local rnd = math.random();
	
	if (rnd < 0.6) then
		return 4;
		
	end
	

end;

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onSpellPrecast(mob, spell)
	 if (spell:getID() == 4) then
        spell:setAoE(SPELLAOE_RADIAL);
        spell:setFlag(SPELLFLAG_HIT_ALL);
        spell:setRadius(30);
        spell:setAnimation(172);
        spell:setMPCost(1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    
end;
