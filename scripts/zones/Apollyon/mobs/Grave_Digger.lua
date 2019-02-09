-----------------------------------
-- Area: Apollyon SE
--  NPC: Grave_Digger

-----------------------------------

function onMobEngaged(mob,target)
    GetMobByID(16933021):updateEnmity(target);
    GetMobByID(16933022):updateEnmity(target);
    GetMobByID(16933023):updateEnmity(target);
    GetMobByID(16933024):updateEnmity(target);
    GetMobByID(16933025):updateEnmity(target);
    GetMobByID(16933026):updateEnmity(target);
    GetMobByID(16933027):updateEnmity(target);
    GetMobByID(16933028):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)

end;