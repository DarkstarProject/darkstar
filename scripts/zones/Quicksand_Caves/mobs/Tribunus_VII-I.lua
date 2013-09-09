-----------------------------------	
-- Area: Quicksand Caves
-- MOB:  Tribunus_VII-I
-- Note: 
-----------------------------------	


-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	GetNPCByID(17629658):hideNPC(900);
end;