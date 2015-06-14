---------------------------------------------------
-- Summonshadows
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
return 1;
end;

function onMobWeaponSkill(target, mob, skill)
local zeid = mob:getID();
local shadow1 = zeid+1;
local shadow2 = zeid+2;
local X = GetMobByID(zeid):getXPos();
local Y = GetMobByID(zeid):getYPos();
local Z = GetMobByID(zeid):getZPos();
if (GetMobAction(shadow1) and GetMobAction(shadow2) == 0)then
SpawnMob(shadow1):setPos(X,Y,Z);
SpawnMob(shadow2):setPos(X,Y,Z);
GetMobByID(shadow1):updateEnmity(target);
GetMobByID(shadow2):updateEnmity(target);
end
skill:setMsg(0);
return 0;

end;
