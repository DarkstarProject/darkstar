-----------------------------------
-- Area: Dynamis Jeuno
--  MOB: Goblin Replica
-- Map1 Position: http://images3.wikia.nocookie.net/__cb20090312005127/ffxi/images/b/bb/Jeu1.jpg
-- Map2 Position: http://images4.wikia.nocookie.net/__cb20090312005155/ffxi/images/3/31/Jeu2.jpg
-- Vanguard Position: http://faranim.livejournal.com/39860.html
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.SUPERLINK, mob:getShortID());
end;

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, jeunoList, 1);
end;

function onMobDeath(mob, player, isKiller)

    mobID = mob:getID();

    -- Time Bonus (30min): 002
    if (mobID == 17547531 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(30);
        mob:addInBattlefieldList();
    -- Time Bonus (30min): 004
    elseif (mobID == 17547533 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(30);
        mob:addInBattlefieldList();
    -- Time Bonus (30min): 029
    elseif (mobID == 17547558 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(30);
        mob:addInBattlefieldList();
    -- Time Bonus (30min): 045
    elseif (mobID == 17547574 and mob:isInBattlefieldList() == false) then
        player:addTimeToDynamis(30);
        mob:addInBattlefieldList();
    end

end;
