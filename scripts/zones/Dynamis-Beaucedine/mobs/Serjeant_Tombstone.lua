-----------------------------------
-- Area: Dynamis Beaucedine
--  MOB: Serjeant Tombstone
-- Map Position: http://images1.wikia.nocookie.net/__cb20090312005233/ffxi/images/thumb/b/b6/Bea.jpg/375px-Bea.jpg
-----------------------------------
require("scripts/globals/dynamis");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, beaucedineOrcishList, 4);
end;

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    -- Time Bonus: 083 087
    if (mobID == 17326912 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(15);
        mob:addInBattlefieldList();
    elseif (mobID == 17326916 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(15);
        mob:addInBattlefieldList();
    -- HP Bonus: 078 084 086 091 095 105
    elseif (mobID == 17326907 or mobID == 17326913 or mobID == 17326915 or mobID == 17326920 or mobID == 17326924 or mobID == 17326934) then
        player:restoreHP(2000);
        player:messageBasic(msgBasic.RECOVERS_HP,(player:getMaxHP()-player:getHP()));
    -- MP Bonus: 080 082 088 094 098
    elseif (mobID == 17326909 or mobID == 17326911 or mobID == 17326917 or mobID == 17326923 or mobID == 17326927) then
        player:restoreMP(2000);
        player:messageBasic(msgBasic.RECOVERS_MP,(player:getMaxMP()-player:getMP()));
    end
end;
