-----------------------------------
-- Area: The Eldieme Necropolis
-- Mob:  Sturm
-- Involved in Quest: A New Dawn (BST AF3)
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------
function onMobDeath(mob, killer, ally)

    local ANewDawn = ally:getQuestStatus(JEUNO,A_NEW_DAWN);
    local ANewDawnEvent = ally:getVar("ANewDawn_Event");

    if (ANewDawn == QUEST_ACCEPTED and ANewDawnEvent == 4) then
        ally:setVar("ANewDawn_Event",5);
    end

    -- Despawn Tigers if alive
    for i = 17576268, 17576269 do
        if (GetMobAction(i) ~= 0) then
            DespawnMob(i);
        end
    end

end;