-----------------------------------
-- Area: Pso'xja
-- NPC:  Golden-Tongued Culberry 
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
	GetNPCByID(16814434):hideNPC(900); -- qm1
end;