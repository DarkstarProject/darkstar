-----------------------------------
-- Area: Eastern Altepa Desert
-- NPC:  Decurio I-III
-- Involved in Quest: A Craftsman's Work
-- @pos X:113 Y:-7 Z:-72 (106)
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer,ally)

    if (ally:getVar("aCraftsmanWork") == 1) then
        ally:setVar("Decurio_I_IIIKilled",1);
    end

end;