-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Adamantking Effigy
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas1.htm
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas2.htm
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, bastyList);
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    -- Time Bonus: 001 019 041
    if (mobID == 17539350 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        mob:addInBattlefieldList(); 
    elseif (mobID == 17539368 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        mob:addInBattlefieldList();
    elseif (mobID == 17539386 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(20);
        mob:addInBattlefieldList();
    -- HP Bonus: 007 008 025 042 082 085 092
    elseif (mobID == 17539356 or mobID == 17539357 or mobID == 17539374 or mobID == 17539387 or
        mobID == 17539426 or mobID == 17539429 or mobID == 17539171) then
        player:restoreHP(2000);
        player:messageBasic(msgBasic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
        -- MP Bonus: 026 031 038 081 104
    elseif (mobID == 17539118 or mobID == 17539161 or mobID == 17539383 or
        mobID == 17539425 or mobID == 17539446) then
        player:restoreMP(2000);
        player:messageBasic(msgBasic.RECOVERS_MP,(player:getMaxMP()-player:getMP()));
    end

end;
