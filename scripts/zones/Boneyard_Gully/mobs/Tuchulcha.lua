-----------------------------------
-- Area: Boneyard Gully
-- NPC:  Tuchulcha
-- ID:     16810001
-----------------------------------
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, 0);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, target)
    mob:useMobAbility(22); -- Pit Ambush
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)
    local phase = mob:getLocalVar("Phase");
    local changePhase = false;
    if (phase == 0 and mob:getHPP() <= 75) then
        phase = 1;
        changePhase = true;
    elseif (phase == 1 and mob:getHPP() <= 50) then
        phase = 2;
        changePhase = true;
    elseif (phase == 2 and mob:getHPP() <= 25) then
        phase = 3;
        changePhase = true;
    end;
    
    if (changePhase == true) then
        mob:setLocalVar("Phase", phase);
        teleportNM(mob);
        mob:setTP(100 * phase);
        mob:setAnimation(0);
        mob:speed(0);
        mob:untargetable(true);
    end
end;

-----------------------------------
-- onMobWeaponSkill
-----------------------------------

function onMobWeaponSkill(mob, target)
    mob:speed(40);
    mob:untargetable(false);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;

-----------------------------------
-- teleportNM
-- Used to move the NM around the battlefield.
-----------------------------------

function teleportNM(mob)
    local spawn = math.random(0, 5);
    local x = 0;
    local y = 0;
    local z = 0;
    local r = 0;
    
    while (mob:getLocalVar("spawn"..spawn) == 1) do
        spawn = math.random(0, 5);
    end
    
    if (spawn == 0) then
        x = -561; y = 2; z = -423;
    elseif (spawn == 1) then
        x = -578; y = 1; z = -419;
    elseif (spawn == 2) then
        x = -575; y = 1; z = -439;
    elseif (spawn == 3) then
        x = -555; y = 1; z = -448;
    elseif (spawn == 4) then
        x = -575; y = 0; z = -453;
    else
        x = -541; y = 0; z = -486;
    end
    
    mob:setPos(x, y, z, r);
    mob:setLocalVar("spawn"..spawn, 1);
end