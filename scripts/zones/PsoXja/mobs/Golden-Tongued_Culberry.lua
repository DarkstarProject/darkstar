-----------------------------------
-- Area: Pso'xja
-- NPC:  Golden-Tongued Culberry 
-----------------------------------


-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    mob:SetAutoAttackEnabled(false);
	mob:SetMobAbilityEnabled(false);
	mob:setMobMod(MOBMOD_MAGIC_COOL, 6);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	GetNPCByID(16814435):hideNPC(900); -- qm1
end;