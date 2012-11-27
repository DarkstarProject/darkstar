-----------------------------------
-- Area: Jugner Forest
-- NPC:  King Arthro
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	if(mob:getBattleTime() == 1200) then
		mob:rageMode();
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	SetServerVariable("[POP]King_Arthro",0);
	
end;