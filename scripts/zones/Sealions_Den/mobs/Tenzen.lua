-----------------------------------
-- Area: Sealion den
-- NPC:  Tenzen
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    switch (mob:getID()) : caseof
    {
        [16908310] = function (x)
            GetMobByID(16908311):updateEnmity(target);
            GetMobByID(16908312):updateEnmity(target);
            GetMobByID(16908313):updateEnmity(target);
        end,
        [16908314] = function (x)
            GetMobByID(16908315):updateEnmity(target);
            GetMobByID(16908316):updateEnmity(target);
            GetMobByID(16908317):updateEnmity(target);
        end,
        [16908318] = function (x)
            GetMobByID(16908319):updateEnmity(target);
            GetMobByID(16908320):updateEnmity(target);
            GetMobByID(16908321):updateEnmity(target);
        end,
    }
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;