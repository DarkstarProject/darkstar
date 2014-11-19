-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  Seiryu
-----------------------------------

require("scripts/zones/RuAun_Gardens/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, killer)
	killer:showText(mob,SKY_GOD_OFFSET + 10);
	GetNPCByID(17310052):hideNPC(900);
end;

-----------------------------------
-- onMonsterMagicPrepare
-----------------------------------

function onMonsterMagicPrepare(mob,target)

	-- For some reason, this returns false even when Hundred Fists is active, so... yeah.
	-- Core does this:
	-- m_PMob->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HUNDRED_FISTS,0,1,0,45));
	if (mob:hasStatusEffect(EFFECT_HUNDRED_FISTS,0) == false) then
		local rnd = math.random();
		if (rnd < 0.5) then
			return 186; -- aeroga 3
		elseif (rnd < 0.7) then
			 return 157; -- aero 4
		elseif (rnd < 0.9) then
			return 208; -- tornado
		else
			return 237; -- choke
		end
	end

end;