-----------------------------------
-- Area: Grand Palace of HuXzoi
-- NPC:  Ix_ghrah
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/missions");
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	if(mob:getMod(0x31))then mob:setMod(0x31,1000); end
	if(mob:getMod(0x32))then mob:setMod(0x32,1000); end
	if(mob:getMod(0x33))then mob:setMod(0x33,1000); end
	if(mob:getMod(0x34))then mob:setMod(0x34,1000); end
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

end;

-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
  if(killer:getCurrentMission(COP) == A_FATE_DECIDED  and killer:getVar("PromathiaStatus")==1)then
    killer:setVar("PromathiaStatus",2);
  end
end;